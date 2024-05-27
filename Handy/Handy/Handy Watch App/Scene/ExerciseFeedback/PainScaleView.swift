//
//  PainScaleView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct PainScaleView: View {
    @State var painIntensity : Int = 0
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    @Environment(WorkoutController.self) var workoutController
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack{
            TitleForm(text: "Qual a intensidade da dor?")
            Spacer()
            StepperImage(value: $painIntensity, interval: 1 ... 10, prefixImage: "pain")
            Spacer()
            ButtonNextPage{
                controller.painLevel = Double(painIntensity)
                controller.avarageHeartBeats = workoutController.averageHeartRate
                controller.endTrainning = workoutController.endTrainning
                controller.maxHeartBeats = workoutController.maxHeartRate
                controller.minHeartBeats = workoutController.minHeartRate
                controller.startTrainning = workoutController.startTrainning
                controller.saveNewExercise(context: context)
                workoutController.reset()
                coordinator.navigateToRoot()
            }
        }
    }
}

#Preview {
    PainScaleView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
