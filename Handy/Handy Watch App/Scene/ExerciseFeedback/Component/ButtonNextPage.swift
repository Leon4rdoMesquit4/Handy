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
    // TODO: AINDA FALTA ADICIONAR UMA LÓGICA QUE VAI FAZER COM QUE O PROGRAMADOR POSSA PASSAR COMO ARGUMENTO A VIEW QUE ELE VAI RENDERIZAR PARA A PRÓXIMA VIEW.
    
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

