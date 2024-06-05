//
//  Title.swift
//  Handy Watch App
//
//  Created by Caio Marques on 21/05/24.
//

import Foundation
import SwiftUI

/// Essa classe foi construída para modularizar a criação de títulos em views do formulário pós treino.
/// - Parameters
///  - text: é o texto que esse objeto vai receber por parâmetro que vai ser estilizado na View
struct TitleForm : View {
    
    var text : String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .bold()
            .frame(height: 40)
    }
}
