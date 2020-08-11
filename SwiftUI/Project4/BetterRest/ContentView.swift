//
//  ContentView.swift
//  BetterRest
//
//  Created by Anuj Rajput on 11/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

let now = Date()
let tomorrow = Date().addingTimeInterval(86400)
let range = now ... tomorrow

struct ContentView: View {
    @State private var wakeUp = Date()
        
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()..., displayedComponents: .hourAndMinute)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
