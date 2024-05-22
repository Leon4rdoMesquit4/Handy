//
//  TreatmentTimeView .swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct TreatmentTimeView_: View {
    @State var dataInicio : Date = Date()
    @State var dataFinal : Date = Date()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Text("Duração do tratamento:")
                .font(.title3)
                .bold()
                .frame(height: 50)
                
            NavigationLink {
                TreatmentTimeBeginningView(dataInicio: $dataInicio)
            } label: {
                VStack (alignment: .leading, spacing: 4){
                    Text("Data de início")
                        .bold()
                        .font(.caption)
                    Text(dataInicio.formatted(date: .numeric, time: .omitted))
                        .font(.caption2)
                }
            }
        
            NavigationLink {
                TreatmentTimeEndView(dataFinal: $dataFinal)
            } label: {
                VStack (alignment: .leading, spacing: 4){
                    Text("Data final")
                        .bold()
                        .font(.caption)
                    Text(dataFinal.formatted(date: .numeric, time: .omitted))
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TreatmentTimeView_()
    }
    
}
