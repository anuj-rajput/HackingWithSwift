//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Anuj Rajput on 05/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(Color.yellow)
            .padding()
            .background(Color.red)
            .padding()
            .background(Color.orange)
            .padding()
            .background(Color.pink)
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
