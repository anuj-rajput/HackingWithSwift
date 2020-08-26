//
//  ContentView.swift
//  Moonshot
//
//  Created by Anuj Rajput on 24/08/20.
//  Copyright © 2020 Anuj Rajput. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        self.text = text
        print("Creating a new \(self)")
    }
}

struct ContentView: View {
    var body: some View {
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//                ForEach(0 ..< 100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
        List {
            ForEach(0 ..< 100) {
                CustomText("Item \($0)")
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
