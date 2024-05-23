//
//  StepperNum.swift
//  Handy Watch App
//
//  Created by Caio Marques on 21/05/24.
//

import Foundation
import SwiftUI

/// A modularização da criação de um stepper que vai alterar o valor de um número e esse número vai alterar a imagem que vai ser mostrada no stepper
/// - Parameters
///     - value: o valor que vai ser alterado pelo stepper
///     - interval: o intervalo do valor máximo e mínimo que o value vai chegar através do stepper
///     - prefixImage: o prefixo do nome da imagem que vai ser exibida no meio do Stepper, ela vai variar de acordo ocm o número passado pelo value.
struct StepperImage : View {
    @Binding var value : Int
    var interval : ClosedRange<Int> = 1 ... 10
    var prefixImage : String
    
    var body: some View {
        Stepper(value: $value, in: interval, label: {
            Image("\(prefixImage)_\(value)")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
        })
    }
}
