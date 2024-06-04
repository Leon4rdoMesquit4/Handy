//
//  GoalEditorDatePickerView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 04/06/24.
//

import Foundation
import SwiftUI

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
