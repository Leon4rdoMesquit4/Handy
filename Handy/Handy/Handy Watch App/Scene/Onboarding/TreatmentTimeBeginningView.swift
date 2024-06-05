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
            
            DatePicker(title, selection: $dataInicio, in: Calendar.current.date(byAdding: .year, value: -20, to: Date.init())!...Calendar.current.date(byAdding: .year, value: 20, to: Date.init())!)
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
