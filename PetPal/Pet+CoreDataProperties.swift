//
//  Pet+CoreDataProperties.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var breed: String?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var owner: Friend?

}
