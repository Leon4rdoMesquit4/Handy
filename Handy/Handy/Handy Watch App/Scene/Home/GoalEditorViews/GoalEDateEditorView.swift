//
//  GoalEDateEditorView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 04/06/24.
//

import SwiftUI

/// View responsável por permitir que o usuário edite o início do seu tratamento e o final do seu tratamento dentro do aplicativo, as alterações feitas aqui deverão ser salvas dentro do User Defaults através do botão de confirmar que estará disposto no final da tela.
struct GoalEDateEditorView: View {
    // MARK: VARIÁVEIS
    /// Variável que representa a data de início de tratamento do usuário que está dentro do User Defaults.
    @AppStorage("dateBeginningTreatment") var beginningTreatmentAppStorage : String = "25_05_2024"
    /// Variável que representa a data de final de tratamento do usuário que está dentro do User Defaults.
    @AppStorage("dateEndTreatment") var endTreatmentAppStorage : String = "31_06_2024"
    
    /// Coordinator: vai fazer o controle de navegação da View.
    @Environment(Coordinator.self) var coordinator
    
    /// variável que representa o valor transitório da data inicial do tratamento do usuário (o valor inicial dela é um valor surreal (ano 1)
    @State var dateBeginning : Date = Calendar.current.date(from: DateComponents(year: 1)) ?? Date()
    /// variável que representa o valor transitório da data final do tratamento do usuário (o valor inicial dela é um valor surreal (ano 1)
    @State var dateEnd : Date = Calendar.current.date(from: DateComponents(year: 1)) ?? Date()
    
    // MARK: BODY
    var body: some View {
        VStack (spacing: 10){
            // Criando os dois elementos para cada uma das datas (data início e final de tratamento)
            DateCard(title: "Início", date: dateBeginning) {
                coordinator.navigate(to: .GoalEditorDatePickerView("Início", $dateBeginning))
            }
            DateCard(title: "Final", date: dateEnd) {
                coordinator.navigate(to: .GoalEditorDatePickerView("Final", $dateEnd))
            }
            
            // A ação do botão para ir para a próxima view é salvar as datas e sair da view.
            ButtonNextPage (callback: {
                saveDates()
                exitView()
            }, systemImage: "checkmark")
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.base)
        .navigationTitle("Tratamento")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            fetchDatesFromAppStorage()
        })
    }
    
    /// Função que recupera os dados salvos no User Defaults para dados temporários
    func fetchDatesFromAppStorage () {
        // verificando se o valor de dateBeginning é a data absurda que eu estabeleci (a com o ano 1), se for a data absurda, eu atribuo o valor ao valor que se encontra dentro do UserDefaults. Faço isso com as duas variáveis.
        if Calendar.current.dateComponents([.year], from: dateBeginning).year == 1 {
            dateBeginning = Date.convertStringToDate(beginningTreatmentAppStorage) ?? Date()
        }
        if Calendar.current.dateComponents([.year], from: dateEnd).year == 1 {
            dateEnd = Date.convertStringToDate(endTreatmentAppStorage) ?? Date()
        }
    }
    
    /// Função que salva os dados temporários no User Defaults.
    func saveDates () {
        // converte as datas para String (na formatação dd_mm_aaaa e salvo elas no User Defaults).
        beginningTreatmentAppStorage = Date.convertDateToString(dateBeginning)
        endTreatmentAppStorage = Date.convertDateToString(dateEnd)
    }
    
    /// Função que sai da View.
    func exitView () {
        // Retira do navPath as duas últimas views, isso vai dar o efeito de duplo dismiss, e como temos certeza que são somente duas views de editar o objetivo do usuário então isso vai funcionar
        coordinator.navPath.removeLast()
        coordinator.navPath.removeLast()
    }
}

#Preview {
    NavigationStack{
        GoalEDateEditorView()
    }
}
