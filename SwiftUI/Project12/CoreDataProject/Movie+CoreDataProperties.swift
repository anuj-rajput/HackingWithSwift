//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Anuj Rajput on 18/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Unknown title"
    }
}
