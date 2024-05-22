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
        VStack (alignment: .leading, spacing: 10){
            treatmentDuration
                .font(.caption)
                .padding(.horizontal)
                
            NavigationLink {
                TreatmentTimeBeginningView(dataInicio: $dataInicio)
            } label: {
                dateButton("Data de início", date: dataInicio)
            }
        
            NavigationLink {
                TreatmentTimeEndView(dataFinal: $dataFinal)
            } label: {
                dateButton("Data final", date: dataFinal)
            }
            
            HStack {
                Spacer()
                ButtonNextPage()
                Spacer()
            }
            
        }
    }
    
    var treatmentDuration : some View {
        Text("Duração do tratamento:")
            .font(.title3)
            .bold()
            .frame(height: 50)
    }
    
    @ViewBuilder
    func dateButton (_ label : String, date : Date) -> some View {
        VStack (alignment: .leading, spacing: 4){
            Text(label)
                .bold()
                .font(.caption)
            Text(date.formatted(date: .numeric, time: .omitted))
        }
    }
}

#Preview {
    NavigationStack {
        TreatmentTimeView_()
    }
    
}
