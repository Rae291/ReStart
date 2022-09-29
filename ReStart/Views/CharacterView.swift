//
//  CharacterView.swift
//  ReStart
//
//  Created by APPLE on 19/09/22.
//

import SwiftUI

struct CharacterView: View {
    
    //MARK: - Property
    @State var imageString: String
    
    var body: some View {
        
            Image(imageString)
                .resizable()
                .scaledToFit()
                .padding()
        }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(imageString: K.character1)
    }
}
