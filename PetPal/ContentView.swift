//
//  ContentView.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(
        entity: Friend.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Friend.dateOfBirth, ascending: false)
        ]
    )
    var friends: FetchedResults<Friend>
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var isShown: Bool = false
    
    var plusButton: some View {
        Button( action: { self.isShown = true } ) {
            Image(systemName: "plus")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends, id: \.id) { friend in
                    VStack(alignment: .leading) {
                        Text(friend.name ?? "Unknown F.R.I.E.N.D.")
                        HStack {
                            Text("\(friend.age)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(friend.info ?? "Unknown")
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle(Text("Friends"))
            .navigationBarItems(leading: EditButton(), trailing: plusButton)
            .sheet(isPresented: $isShown) {
                NewFriendView()
                    .environment(\.managedObjectContext, self.managedObjectContext)
            }
        }
    }
    
    func delete(at indexes: IndexSet) {
        for index in indexes {
            let friend = friends[index]
            managedObjectContext.delete(friend)
            try? managedObjectContext.save()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
