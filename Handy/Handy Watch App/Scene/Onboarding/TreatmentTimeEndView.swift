//
//  TreatmentTimeEndView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeEndView: View {
    @Binding var dataFinal : Date
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            DatePicker("Data do final", selection: $dataFinal)
            
            Button ("Definir") {
                dismiss()
            }
        }
    }
}

#Preview {
    TreatmentTimeEndView(dataFinal: .constant(Date()))
}
