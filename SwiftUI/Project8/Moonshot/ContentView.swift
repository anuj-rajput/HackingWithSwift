//
//  ContentView.swift
//  Moonshot
//
//  Created by Anuj Rajput on 24/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text("Astronauts: \(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
