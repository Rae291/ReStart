//
//  SlideBarView.swift
//  ReStart
//
//  Created by APPLE on 29/09/22.
//

import SwiftUI

struct SlideBarView: View {
    
    //MARK: - Property
    private var onboardingView = OnboardingView()
    
    //MARK: - Body
    var body: some View {
        ZStack{
            
            //Capsule Bar (Empty)
            Capsule()
                .capsuleFill()
            
            Capsule()
                .capsuleFill()
                .padding(8)
            
            //Capsule Bar Text
            Text(K.barText)
                .capsuleBarTextFormat()
            
            
        }//eo ZStack
        .frame(width: onboardingView.buttonWidth ,height: 80, alignment: .center)
    }
}

struct SlideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SlideBarView()
            .previewLayout(.sizeThatFits)
    }
}
