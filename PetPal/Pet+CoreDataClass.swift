//
//  Pet+CoreDataClass.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pet)
public class Pet: NSManagedObject {

    var formattedDateOfBirth: String {
        guard let dateOfBirth = dateOfBirth else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: dateOfBirth)
    }
    
}
