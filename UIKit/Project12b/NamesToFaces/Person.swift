//
//  Person.swift
//  NamesToFaces
//
//  Created by Anuj Rajput on 28/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
