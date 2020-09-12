//
//  Order.swift
//  CupcakeCorner
//
//  Created by Anuj Rajput on 11/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import UIKit

struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
        
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}

class Transaction: ObservableObject {
    @Published var order: Order
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                order.extraFrosting = false
                order.addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if order.name.isEmpty || order.streetAddress.isEmpty || order.city.isEmpty || order.zip.isEmpty {
            return false
        }
        
        if order.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(order.quantity) * 2
        cost += Double(order.type) / 2
        
        if order.extraFrosting {
            cost += Double(order.quantity)
        }
        
        if order.addSprinkles {
            cost += Double(order.quantity) / 2
        }
        
        return cost
    }
    
    init(with order: Order) {
        self.order = order
    }
}
