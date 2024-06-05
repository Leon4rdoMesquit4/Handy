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
    var title : String = "Data de início"
    
    var body: some View {
        
        VStack (spacing: 20){
            
            DatePicker(title, selection: $dataInicio)
                .frame(height: 120)
            
            Button ("Definir") {
                coordinator.navigateBack()
            }
        }
        
    }
}

#Preview {
    TreatmentTimeBeginningView(dataInicio: .constant(Date()), title: "Data de início")
        .environment(OnboardingCoordinator())
}
