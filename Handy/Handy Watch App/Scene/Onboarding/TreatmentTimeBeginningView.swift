//
//  TreatmentTimeBeginningView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeBeginningView: View {
    @Binding var dataInicio : Date
    
    var body: some View {
        DatePicker("Data de início", selection: $dataInicio)
        
        
    }
}

#Preview {
    TreatmentTimeBeginningView(dataInicio: .constant(Date()))
}
