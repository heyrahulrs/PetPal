//
//  NewFriendView.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct NewFriendView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode

    @State var name: String = ""
    @State var dateOfBirth: Date = Date()
    @State var info: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter your friend's name", text: $name)
            }
            
            DatePicker(
                selection: $dateOfBirth,
                displayedComponents: [.date]
            ) {
                Text("Enter your friend's DOB")
            }
            
            Section {
                TextField("Additional info...", text: $info)
            }
            
            Section {
                Button(
                    action: { self.addFriend() }
                ) {
                    Text("Add")
                }
                
            }
                
            Section {
                Button(
                    action: { self.presentationMode.wrappedValue.dismiss() }
                ) {
                    Text("Cancel")
                }
            }
        }

    }
    
    func addFriend() {
        let friend = Friend(entity: Friend.entity(),
                            insertInto: managedObjectContext)
        friend.id = UUID()
        friend.name = name
        friend.dateOfBirth = dateOfBirth
        friend.info = info
        
        try? managedObjectContext.save()
        
        presentationMode.wrappedValue.dismiss()
    }
    
}
