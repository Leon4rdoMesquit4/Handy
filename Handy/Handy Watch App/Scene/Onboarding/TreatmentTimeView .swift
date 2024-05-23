//
//  TreatmentTimeView .swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeView_: View {
    @Binding var isOnboardingComplete: Bool
    @State var dataInicio : Date = Date()
    @State var dataFinal : Date = Date()
    @Environment(OnboardingCoordinator.self) var coordinator
    
    // MARK: VARIÁVEIS RELACIONADAS AO QUE ESTÁ SENDO SALVO NO USERDEFAULTS
    // A data de início do tratamento e a data do fim do tratamento.
    @AppStorage ("dateBeginningTreatment") var dateBeginningTreatment : String = Date().formatted()
    @AppStorage ("dateEndTreatment") var dateEndTreatment : String = Date().formatted()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            treatmentDuration
                .font(.caption)
                .padding(.horizontal)
                
            
                dateButton("Data de início", date: dataInicio)
                .onTapGesture {
                    coordinator.navigate(to: .treatmentTimeBeginningView($dataInicio))
                }
        
                        
                dateButton("Data final", date: dataFinal)
                .onTapGesture {
                    coordinator.navigate(to: .treatmentTimeEndView($dataFinal))
                }
            
            
            HStack {
                Spacer()
                ButtonNextPage{
                    // salvando as coisas no User Defaults
                    // TODO: AINDA FAREI ALGUMAS VALIDAÇÕES
                    self.dateBeginningTreatment = dataInicio.formatted()
                    self.dateEndTreatment = dataFinal.formatted()
                    isOnboardingComplete = true
                }
                Spacer()
            }
            
        }
    }
    
    var treatmentDuration : some View {
        Text("Duração do tratamento:")
            .font(.title3)
            .bold()
            .frame(height: 50)
    }
    
    @ViewBuilder
    func dateButton (_ label : String, date : Date) -> some View {
        VStack (alignment: .leading, spacing: 4){
            Text(label)
                .bold()
                .font(.caption)
            Text(date.formatted(date: .numeric, time: .omitted))
        }
    }
}

#Preview {
    NavigationStack {
        TreatmentTimeView_( isOnboardingComplete: .constant(true))
            .environment(OnboardingCoordinator())
    }
    
}
