//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Anuj Rajput on 18/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?

    var wrappedFirstName: String {
        firstName ?? "Unknwon"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknwon"
    }
}
