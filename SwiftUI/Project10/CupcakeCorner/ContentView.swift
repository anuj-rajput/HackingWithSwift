//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Anuj Rajput on 10/09/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var transaction = Transaction(with: Order())
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $transaction.order.type) {
                        ForEach(0 ..< Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $transaction.order.quantity, in: 3...20) {
                        Text("Number of cakes: \(transaction.order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $transaction.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if transaction.specialRequestEnabled {
                        Toggle(isOn: $transaction.order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $transaction.order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(transaction: transaction)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
