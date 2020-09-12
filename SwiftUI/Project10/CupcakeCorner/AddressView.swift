//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Anuj Rajput on 11/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var transaction: Transaction
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $transaction.order.name)
                TextField("Street Address", text: $transaction.order.streetAddress)
                TextField("City", text: $transaction.order.city)
                TextField("Zip", text: $transaction.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(transaction: transaction)) {
                    Text("Check out")
                }
            }
            .disabled(transaction.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(transaction: Transaction(with: Order()))
    }
}
