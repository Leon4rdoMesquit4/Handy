//
//  CircularProgressBarView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import Foundation
import SwiftUI

/// A modularização de uma Progress Bar Circular que vai servir para fazer a contagem regressiva para iniciar o exercício.
/// - Parameters:
///    - contagem: o valor Double que vai ser utilizado para guardar o valor atual da contagem regressiva.
///    - contagemMaxima: o valor Double que vai representar o valor máximo que a contagem pode assumir.
///    - cor: a cor do progresso da ProgressBar
struct CircularProgressBar: View {
    @Binding var contagem : Double
    var contagemMaxima : Double
    var cor : Color = .accentColor
    
    /// Percentage é a variável computada
    /// A complexidade dela é O(1)
    var percentage : Double {
        contagem / contagemMaxima
    }
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .foregroundStyle(.background)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(percentage, 1)))
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .foregroundStyle(cor)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 0.5), value: contagem)
        }
    }
}
