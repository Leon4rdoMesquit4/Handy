//
//  GoalEditorDatePickerView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 04/06/24.
//

import Foundation
import SwiftUI

/// View que renderiza um DatePicker e permite a alteração de uma data enviada como Binding
/// - Parameters:
///    - dataInicio: o Binding da data que vai ser alterada.
///    - title: String que vai ser exibida na tela.
struct GoalEditorDatePickerView : View {
    @Binding var dataInicio : Date
    @Environment(Coordinator.self) var coordinator
    var title : String
    
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
    GoalEditorDatePickerView(dataInicio: .constant(Date()), title: "Date")
}
