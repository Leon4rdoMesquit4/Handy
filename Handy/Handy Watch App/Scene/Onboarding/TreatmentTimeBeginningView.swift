//
//  TreatmentTimeBeginningView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeBeginningView: View {
    @Environment (\.dismiss) var dismiss
    @Binding var dataInicio : Date
    
    var body: some View {
        
        VStack (spacing: 20){
            DatePicker("Data de início", selection: $dataInicio)
                .frame(height: 120)
            
            Button ("Definir") {
                dismiss()
            }
        }
        
    }
}

#Preview {
    TreatmentTimeBeginningView(dataInicio: .constant(Date()))
}
