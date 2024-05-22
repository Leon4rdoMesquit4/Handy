//
//  ExerciseDifficultyView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseUserFeedbackView: View {
    @State var feedback : Int = 1
    @Environment(ExerciseCoordinator.self) var coordinator
    
    
    
    var body: some View {
        VStack (spacing: 8) {
            TitleForm(text: "Como foi a prática do exercício")
            Spacer()
            StepperImage(value: $feedback, interval: 1 ... 10, prefixImage: "mood")
            Spacer()
//            ButtonNextPage()
            
            Text("ExerciseControlView")
                .onTapGesture {
                    coordinator.navigate(to: .borgScaleView)
                }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ExerciseUserFeedbackView()
}
