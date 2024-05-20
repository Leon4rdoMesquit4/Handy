//
//  ExerciseDifficultyView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseDifficultyView: View {
    @State var difficulty : Int = 0
    
    var body: some View {
        VStack (spacing: 5) {
            Text("Qual a dificuldade")
                .multilineTextAlignment(.center)
                .bold()
            
            Spacer()
            Stepper(value: $difficulty, label: {
                Text(difficulty.description)
                    .frame(width: 75, height: 75)
                    .background(Color.secondary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            
            Spacer()
            Button {
                
            } label: {
                Image (systemName: "chevron.right")
            }
            .frame(width: 75)
        }
    }
}

#Preview {
    ExerciseDifficultyView()
}
