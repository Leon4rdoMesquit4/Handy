//
//  ExerciseDifficultyView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseUserFeedbackView: View {
    @State var feedback : Int = 1
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        VStack (spacing: 8) {
            TitleForm(text: "Como foi a prática do exercício")
            Spacer()
            StepperImage(value: $feedback, interval: 1 ... 10, prefixImage: "mood")
            Spacer()
            ButtonNextPage{
                coordinator.navigate(to: .borgScaleView)
            }
        }
    }
}

#Preview {
    ExerciseUserFeedbackView()
}
