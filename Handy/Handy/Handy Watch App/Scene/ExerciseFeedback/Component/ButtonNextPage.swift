//
//  ButtonNextPage.swift
//  Handy Watch App
//
//  Created by Caio Marques on 21/05/24.
//

import Foundation
import SwiftUI

/// Uma View que vai renderizar um botão na tela que vai redirecionar o usuário para a próxima tela
struct ButtonNextPage : View {
    
    var callback: (() -> Void)
    
    var body: some View {
        
        Image(systemName: "chevron.right")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.base)
            .frame(height: 15)
            .bold()
            .frame(width: 70, height: 25)
            .background(
                Color.brand
            )
            .clipShape(Capsule())
            .onTapGesture {
                callback()
            }
    }
}

#Preview {
    ButtonNextPage {
        
    }
}

