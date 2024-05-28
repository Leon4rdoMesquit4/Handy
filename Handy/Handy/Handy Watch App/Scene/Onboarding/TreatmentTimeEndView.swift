//
//  TreatmentTimeEndView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

/// Uma view que serve para definir o valor do fim do tratamento
/// - Parameters:
///      - dataFinal: o valor que vai representar o dia que vai acabar o tratamento do cliente

struct TreatmentTimeEndView: View {
    @Binding var dataFinal : Date
    @Environment(OnboardingCoordinator.self) var coordinator
    
    var body: some View {
        VStack {
            DatePicker("Data do final", selection: $dataFinal, in: Date() ... Date().addingTimeInterval(.infinity), displayedComponents: .date)
                
            
            Button ("Definir") {
                coordinator.navigateBack()
            }
        }
    }
}

#Preview {
    TreatmentTimeEndView(dataFinal: .constant(Date()))
        .environment(OnboardingCoordinator())
}
