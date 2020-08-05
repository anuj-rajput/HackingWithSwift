//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Anuj Rajput on 05/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonIsRed = false
    var body: some View {
        Button("Hello, World!") {
            self.buttonIsRed.toggle()
        }
        .foregroundColor(buttonIsRed ? Color.red : Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
