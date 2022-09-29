//
//  CircleButtonView.swift
//  ReStart
//
//  Created by APPLE on 29/09/22.
//

import SwiftUI

struct CircleButtonView: View {
    
    //MARK: - Body
    var body: some View {
        
        ZStack {
            Circle()
                .redCircleFill()
            
            Circle()
                .blackCircleFill()
            
            Image(systemName: K.slideIcon)
                .slideIconModifier()
        }//eo ZStack
        .circleButtonModifier()
        
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView()
            .previewLayout(.sizeThatFits)
    }
}
