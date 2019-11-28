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
                    action: {
                        let friend = Friend(entity: Friend.entity(),
                                            insertInto: self.managedObjectContext)
                        friend.name = self.name
                        friend.dateOfBirth = self.dateOfBirth
                        friend.info = self.info
                        
                        try? self.managedObjectContext.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                ) {
                    Text("Add")
                }
                
            }
                
            Section {
                Button(
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                ) {
                    Text("Cancel")
                }
            }
        }

    }
    
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView()
    }
}
