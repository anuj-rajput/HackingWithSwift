//
//  Order.swift
//  CupcakeCorner
//
//  Created by Anuj Rajput on 11/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
