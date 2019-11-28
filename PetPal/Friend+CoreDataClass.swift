//
//  Friend+CoreDataClass.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Friend)
public class Friend: NSManagedObject {
    
    var age: Int {
        guard let dateOfBirth = dateOfBirth else { return 0 }
        return Calendar.current.dateComponents(
            [.year], from: dateOfBirth, to: Date()
        ).year ?? 0
    }

}
