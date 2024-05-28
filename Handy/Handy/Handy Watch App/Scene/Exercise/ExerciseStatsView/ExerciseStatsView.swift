//
//  ExerciseDetailView.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct ExerciseStatsView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Tempo de PrÃ¡tica")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TimeView()
                .font(.system(.title,design: .rounded).monospacedDigit().lowercaseSmallCaps())
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            
            HStack{
                Image(systemName: "heart.fill")
                Text(90.formatted(.number.precision(.fractionLength(0))) + " bpm")
            }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ExerciseStatsView()
}
