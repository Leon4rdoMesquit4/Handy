//
//  TreatmentTimeEndView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeEndView: View {
    @Binding var dataFinal : Date
    @Environment(OnboardingCoordinator.self) var coordinator
    
    var body: some View {
        VStack {
            DatePicker("Data do final", selection: $dataFinal)
            
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
