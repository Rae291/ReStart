//
//  OnboardingView.swift
//  ReStart
//
//  Created by APPLE on 19/09/22.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - Property
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = K.onboardingHeader1
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color(K.colorBlue)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                //MARK: - Header
                VStack(spacing: 0) {
                    
                    Text(textTitle)
                        .onboardingHeaderFormat()
                        .id(textTitle)
                    
                    Text(K.onboardingHeadline)
                    .onboardingHeadlineFormat()
                }//eo VStack(spacing: 0)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: - Center
                ZStack{
                    
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    CharacterView(imageString: K.character1)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 25)))
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = K.onboardingHeader2
                                        }
                                    }
                                }
                                .onEnded{ _ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.9)) {
                                        indicatorOpacity = 1
                                        textTitle = K.onboardingHeader1
                                    }
                                }
                        )
                        .animation(.easeOut(duration: 0.7), value: imageOffset)
                }
                .overlay(
                    Image(systemName: K.dragIcon)
                        .dragIconModifier()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity),
                    alignment: .bottom
                )
                
                Spacer()
                
                //MARK: - Footer
                ZStack{
                    
                    ZStack{
                        
                        //Slide Bar
                        SlideBarView()
                        
                        //Capsule Bar (Fill)
                        HStack{
                            Capsule()
                                .redCapsuleFill()
                                .frame(width: buttonOffset > buttonWidth / 2 ? buttonOffset + 72 : buttonOffset + 80)
                            Spacer()
                        }

                    }
                    
                    //Circle Button
                    HStack {
                        
                        CircleButtonView()
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                            
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                            
                                .onEnded({ _ in
                                    withAnimation(Animation.easeOut(duration: 0.5)){
                                        if buttonOffset > buttonWidth/2{
                                            buttonOffset = buttonWidth - 80
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound(K.toHome)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                                isOnboardingViewActive = false
                                            }
                                        } else {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                        
                        Spacer()
                        
                    }
                    
                }//eo ZStack
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
