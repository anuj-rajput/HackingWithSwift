//
//  ContentView.swift
//  Moonshot
//
//  Created by Anuj Rajput on 24/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("swift")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width , height: 400)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
