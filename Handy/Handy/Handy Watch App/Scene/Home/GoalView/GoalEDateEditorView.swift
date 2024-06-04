//
//  GoalEDateEditorView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 04/06/24.
//

import SwiftUI

struct GoalEDateEditorView: View {
    @AppStorage("dateBeginningTreatment") var beginningTreatmentAppStorage : String = "25_05_2024"
    @AppStorage("dateEndTreatment") var endTreatmentAppStorage : String = "31_06_2024"
    
    @Environment(Coordinator.self) var coordinator
    
    @State var dateBeginning : Date = Calendar.current.date(from: DateComponents(year: 1)) ?? Date()
    @State var dateEnd : Date = Calendar.current.date(from: DateComponents(year: 1)) ?? Date()
    
    var body: some View {
        VStack (spacing: 10){
            element("Início", date: $dateBeginning)
            element("Final", date: $dateEnd)
            
            ButtonNextPage (callback: {
                beginningTreatmentAppStorage = Date.convertDateToString(dateBeginning)
                endTreatmentAppStorage = Date.convertDateToString(dateEnd)
                
                coordinator.navPath.removeLast()
                coordinator.navPath.removeLast()
            }, systemImage: "checkmark")
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.base)
        .navigationTitle("Tratamento")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            // verificando se o valor de dateBeginning é a data absurda que eu estabeleci (a com o ano 1), se for a data absurda, eu atribuo o valor ao valor que se encontra dentro do UserDefaults. Faço isso com as duas variáveis.
            if Calendar.current.dateComponents([.year], from: dateBeginning).year == 1 {
                dateBeginning = Date.convertStringToDate(beginningTreatmentAppStorage) ?? Date()
            }
            if Calendar.current.dateComponents([.year], from: dateEnd).year == 1 {
                dateEnd = Date.convertStringToDate(endTreatmentAppStorage) ?? Date()
            }
        })
    }
    
    @ViewBuilder
    func element (_ title : String, date : Binding<Date>) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(.brand.opacity(0.5))
            .overlay (alignment: .topLeading){
                
                VStack (alignment: .leading){
                    Text(title)
                        .font(.caption2)
                        .bold()
                    Text(dateLabel(date.wrappedValue))
                        .font(.caption2)
                        .foregroundStyle(.brandColor2)
                }
                .padding(3)
                .padding(.horizontal)
            }
            .onTapGesture {
                coordinator.navigate(to: .GoalEditorDatePickerView(title, date))
                
            }
    }
    
    func dateLabel (_ date : Date?) -> String {
        if let date {
            return date.formatted(date: .numeric, time: .omitted)
        } else {
            return "dd/mm/aaaa"
        }
    }
}

#Preview {
    NavigationStack{
        GoalEDateEditorView()
    }
}
