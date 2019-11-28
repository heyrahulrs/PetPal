//
//  Friend+CoreDataProperties.swift
//  PetPal
//
//  Created by Rahul Sharma on 11/28/19.
//  Copyright © 2019 Rahul Sharma. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var pets: NSSet?

}

// MARK: Generated accessors for pets
extension Friend {

    @objc(addPetsObject:)
    @NSManaged public func addToPets(_ value: Pet)

    @objc(removePetsObject:)
    @NSManaged public func removeFromPets(_ value: Pet)

    @objc(addPets:)
    @NSManaged public func addToPets(_ values: NSSet)

    @objc(removePets:)
    @NSManaged public func removeFromPets(_ values: NSSet)

}
