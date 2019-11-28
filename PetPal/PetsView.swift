//
//  PetsView.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI
import CoreData

struct PetsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest var pets: FetchedResults<Pet>
    
    @State var isShown: Bool = false
    
    var friend: Friend
    
    init(friend: Friend) {
        self.friend = friend
        self._pets = FetchRequest(
            entity: Pet.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Pet.dateOfBirth, ascending: false)
            ],
            predicate: NSPredicate(format: "owner = %@", friend),
            animation: nil
        )
    }
    
    var plusButton: some View {
        Button(action: { self.isShown = true }) {
            Image(systemName: "plus")
        }
    }
        
    var body: some View {
        List {
            ForEach(pets, id: \.id) { pet in
                VStack(alignment: .leading) {
                    Text(pet.name ?? "")
                    HStack {
                        Text(pet.formattedDateOfBirth)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("・")
                        Text(pet.breed ?? "Unknown Breed")
                            .font(.subheadline)
                    }
                }
            }
            .onDelete(perform: delete)
        }
        .navigationBarTitle(Text("\(friend.name!.capitalized)'s pets"),
                            displayMode: .inline)
        .navigationBarItems(trailing:
            HStack {
                EditButton()
                plusButton
            }
        )
        .sheet(isPresented: $isShown) {
            NewPetView(friend: self.friend)
                .environment(\.managedObjectContext, self.managedObjectContext)
        }
    }
    
    func delete(at indexes: IndexSet) {
        for index in indexes {
            let pet = pets[index]
            managedObjectContext.delete(pet)
            try? managedObjectContext.save()
        }
    }
    
}

struct PetsView_Previews: PreviewProvider {
    static var previews: some View {
        PetsView(friend: Friend())
    }
}
