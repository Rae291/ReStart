//
//  Extensions.swift
//  ReStart
//
//  Created by APPLE on 29/09/22.
//

import SwiftUI

//MARK: - Text Modifier Extensions
extension Text {
    
    func onboardingHeaderFormat() -> some View {
        self
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .transition(.opacity)
    }
    
    func homeHeaderFormat() -> some View {
        self
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.secondary)
            .offset(y: -10)
    }
    
    func onboardingHeadlineFormat() -> some View {
        self
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
    }
    
    func homeHeadlineFormat() -> some View {
        self
            .font(.title2)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    func capsuleBarTextFormat() -> some View {
        self
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
    }
    
    func restartFormat() -> some View {
        self
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
    }
    
}

//MARK: - Image Modifier Extensions
extension Image {
    
    func dragIconModifier() -> some View {
        self
            .font(.system(size: 45, weight: .ultraLight))
            .foregroundColor(.white)
            .offset(y: 25)
    }
    
    func slideIconModifier() -> some View {
        self
            .font(.system(size: 24, weight: .bold))
    }
    
}

//MARK: - Capsule Modifier Extensions
extension Capsule {
    
    func capsuleFill() -> some View {
        self
            .fill(Color.white.opacity(0.2))
    }
    
    func redCapsuleFill() -> some View {
        self
            .fill(Color(K.colorRed))
    }
    
}

//MARK: - Circle Modifier Extensions
extension Circle {
    
    func redCircleFill() -> some View {
        self
            .fill(Color(K.colorRed))
    }
    
    func blackCircleFill() -> some View {
        self
            .fill(.black.opacity(0.15))
            .padding(8)
    }
}

//MARK: - View Modifier Extensions
extension View {
    
    func circleButtonModifier() -> some View {
        self
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
    }
    
}

//MARK: - Button Modifier Extensions
extension Button {
    
    func restartButtonModifier() -> some View {
        self
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
    }
    
}
