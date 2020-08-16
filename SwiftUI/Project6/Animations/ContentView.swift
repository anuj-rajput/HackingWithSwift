//
//  ContentView.swift
//  Animations
//
//  Created by Anuj Rajput on 15/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
