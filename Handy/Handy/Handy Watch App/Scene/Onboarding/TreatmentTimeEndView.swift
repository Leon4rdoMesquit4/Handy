//
//  TreatmentTimeEndView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI
import WatchKit

struct TreatmentTimeEndView: View {
    @Binding var dataFinal : Date
    @Environment(OnboardingCoordinator.self) var coordinator
    @State var scrollAmount = 0.0
    
    var body: some View {
        VStack {
            DatePicker("Data do final", selection: $dataFinal, in: Calendar.current.date(byAdding: .year, value: -20, to: Date.init())!...Calendar.current.date(byAdding: .year, value: 20, to: Date.init())!)
            
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
