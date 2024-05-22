//
//  TreatmentTimeEndView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeEndView: View {
    @Binding var dataFinal : Date
    
    var body: some View {
        DatePicker("Data do final", selection: $dataFinal)
    }
}

#Preview {
    TreatmentTimeEndView(dataFinal: .constant(Date()))
}
