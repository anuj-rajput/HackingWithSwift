//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Anuj Rajput on 05/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(Color.red)
            CapsuleText(text: "Second")
                .foregroundColor(Color.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
