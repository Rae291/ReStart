//
//  HomeView.swift
//  ReStart
//
//  Created by APPLE on 19/09/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing:20) {
            //MARK: - Header
            
            Spacer()
            
            Text(K.homeHeader)
                .homeHeaderFormat()
                .blur(radius: isAnimating ? 0 : 10)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .animation(.easeOut(duration: 0.7), value: isAnimating)
            
            ZStack {
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                CharacterView(imageString: K.character2)

                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 3)
                            .repeatForever()
                        , value: isAnimating
                    )
            }
            
            //MARK: - Center
            
            Text(K.homeHeadline)
                .homeHeadlineFormat()
                .blur(radius: isAnimating ? 0 : 10)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .animation(.easeOut(duration: 0.7), value: isAnimating)
            
            //MARK: - Footer
            
            Spacer()
            
            Button(action:{
                withAnimation {
                    playSound(K.toOnboarding)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isOnboardingViewActive = true
                    }
                }
            }) {
                ReStartButtonView()
            }
            .restartButtonModifier()
            .blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.5)
            .animation(.easeOut(duration: 0.7), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
