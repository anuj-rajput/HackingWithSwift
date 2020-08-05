//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Anuj Rajput on 05/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let motto1 = Text("We learn to serve")
    let motto2 = Text("We shall overcome")
    var motto3: some View { Text("This is done") }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(Color.red)
            motto2
                .foregroundColor(Color.blue)
            motto3
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
