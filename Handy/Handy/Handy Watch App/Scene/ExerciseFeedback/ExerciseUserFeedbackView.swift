//
//  ExerciseDifficultyView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI
import SwiftData

struct ExerciseUserFeedbackView: View {
    @State var feedback : Int = 1
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    
    var body: some View {
        VStack (spacing: 8) {
            TitleForm(text: "Como foi a prática do exercício")
            Spacer()
            StepperImage(value: $feedback, interval: 1 ... 10, prefixImage: "mood")
            Spacer()
            ButtonNextPage{
                controller.exerciseFeedback = Double(feedback)
                coordinator.navigate(to: .borgScaleView)
            }
        }
    }
}

#Preview {
    ExerciseUserFeedbackView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}