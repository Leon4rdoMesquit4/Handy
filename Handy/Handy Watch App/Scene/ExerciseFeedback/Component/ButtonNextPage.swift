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
        Button {
            callback()
        } label: {
            Image (systemName: "chevron.right")
        }
        .frame(width: 75)
    }
}

