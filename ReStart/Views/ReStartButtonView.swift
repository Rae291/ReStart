//
//  ReStartButtonView.swift
//  ReStart
//
//  Created by APPLE on 29/09/22.
//

import SwiftUI

struct ReStartButtonView: View {
    
    //MARK: - Property
    var homeview = HomeView()
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    //MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: K.restartIcon)
                .imageScale(.large)
            
            Text(K.buttonText)
                .restartFormat()
        }
    }
}

struct ReStartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ReStartButtonView()
            .previewLayout(.sizeThatFits)
    }
}
