//
//  ContentView.swift
//  ReStart
//
//  Created by APPLE on 19/09/22.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
