//
//  ContentView.swift
//  BucketList
//
//  Created by Anuj Rajput on 27/09/20.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible or not
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible so go ahead and use it
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticatedError) in
                // authentication is complete
                DispatchQueue.main.async {
                    if success {
                        // authenticated successfully
                        self.isAuthenticated = true
                    } else {
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
