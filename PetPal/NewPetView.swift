//
//  NewPetView.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//

import SwiftUI

struct NewPetView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var dateOfBirth: Date = Date()
    @State var breed: String = ""
    
    var friend: Friend
    
    var body: some View {
        Form {
            Section {
                TextField("Enter pet's name", text: $name)
            }
            
            DatePicker(
                selection: $dateOfBirth,
                displayedComponents: [.date]
            ) {
                Text("Enter pet's DOB")
            }
            
            Section {
                TextField("Enter pet's breed", text: $breed)
            }
            
            Section {
                Button(
                    action: { self.addPet() }
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
    
    func addPet() {
        let pet = Pet(entity: Pet.entity(),
                      insertInto: managedObjectContext)
        pet.id = UUID()
        pet.name = name
        pet.dateOfBirth = dateOfBirth
        pet.breed = breed
        pet.owner = friend
        
        try? managedObjectContext.save()
        
        presentationMode.wrappedValue.dismiss()
    }
}
