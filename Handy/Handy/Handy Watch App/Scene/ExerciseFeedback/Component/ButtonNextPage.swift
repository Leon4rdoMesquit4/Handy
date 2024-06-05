//
//  ButtonNextPage.swift
//  Handy Watch App
//
//  Created by Caio Marques on 21/05/24.
//

import Foundation
import SwiftUI

/// Uma View que vai renderizar um botão na tela que vai redirecionar o usuário para a próxima tela
/// Recebe um systemImage caso seja uma imagem diferente de um chevron que se deseja apresentar.
struct ButtonNextPage : View {
    
    var callback: (() -> Void)
    var systemImage : String = "chevron.right"
    
    var body: some View {
        
        Image(systemName: systemImage)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.base)
            .frame(height: 15)
            .bold()
            .frame(width: 60, height: 28)
            .background(
                Color.brandColor2
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

