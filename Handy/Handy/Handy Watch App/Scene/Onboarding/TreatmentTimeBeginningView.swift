//
//  TreatmentTimeBeginningView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeBeginningView: View {
    
    @Binding var dataInicio : Date
    @Environment(OnboardingCoordinator.self) var coordinator
    
    var body: some View {
        
        VStack (spacing: 20){
            DatePicker("Data de início", selection: $dataInicio)
                .frame(height: 120)
            
            Button ("Definir") {
                coordinator.navigateBack()
            }
        }
        
    }
}

#Preview {
    TreatmentTimeBeginningView(dataInicio: .constant(Date()))
        .environment(OnboardingCoordinator())
}
