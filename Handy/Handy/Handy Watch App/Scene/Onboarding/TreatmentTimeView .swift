//
//  TreatmentTimeView .swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI
import WidgetKit

struct TreatmentTimeView_: View {
    @Binding var isOnboardingComplete: Bool
    @State var dataInicio : Date = Date()
    @State var dataFinal : Date = Date()
    @State var showAlert: Bool = false
    @Environment(OnboardingCoordinator.self) var coordinator
    
    // MARK: VARIÁVEIS RELACIONADAS AO QUE ESTÁ SENDO SALVO NO USERDEFAULTS
    // A data de início do tratamento e a data do fim do tratamento.
    @AppStorage ("dateBeginningTreatment", store: UserDefaults(suiteName: "group.Luca.Handy")) var dateBeginningTreatment : String = Date().formatted()
    @AppStorage ("dateEndTreatment", store: UserDefaults(suiteName: "group.Luca.Handy")) var dateEndTreatment : String = Date().formatted()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10){
                Text("Duração do tratamento:")
                    .foregroundStyle(.brand)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                
                dateButton(String(localized: "Data de início"), date: dataInicio)
                    .accessibilityAction {
                        coordinator.navigate(to: .treatmentTimeBeginningView($dataInicio))
                    }
                    .onTapGesture {
                        coordinator.navigate(to: .treatmentTimeBeginningView($dataInicio))
                    }
            
                            
                dateButton(String(localized: "Data final"), date: dataFinal)
                    .accessibilityAction {
                        coordinator.navigate(to: .treatmentTimeBeginningView($dataInicio))
                    }
                    .onTapGesture {
                        coordinator.navigate(to: .treatmentTimeEndView($dataFinal))
                    }
                
                
                HStack {
                    Spacer()
                    ButtonNextPage{
                        // salvando as coisas no User Defaults
                        // TODO: AINDA FAREI ALGUMAS VALIDAÇÕES
                        if dataInicio < dataFinal{
                            self.dateBeginningTreatment = Date.convertDateToString(dataInicio)
                            self.dateEndTreatment = Date.convertDateToString(dataFinal)
                            WidgetCenter.shared.reloadTimelines(ofKind: "ProgressComplication")
                            isOnboardingComplete = true
                        } else {
                            showAlert.toggle()
                        }
                    }
                    Spacer()
                }
                
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Selecione datas válidas"), message: Text("A data de final deve ser uma data após a de início"), dismissButton: .default(Text("ok")))
            }
        }
        .padding()
        .padding(.top, 30)
        .background(Color.base)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func dateButton (_ label : String, date : Date) -> some View {
        VStack (alignment: .leading, spacing: 4){
            HStack {
                VStack (alignment: .leading) {
                    Text(label)
                        .fontWeight(.semibold)
                        .font(.caption)
                    Text(date.formatted(date: .numeric, time: .omitted))
                        .font(.caption2)
                        .foregroundStyle(.brandColor2)
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.brand.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    NavigationStack {
        TreatmentTimeView_( isOnboardingComplete: .constant(true))
            .environment(OnboardingCoordinator())
    }
    
}
