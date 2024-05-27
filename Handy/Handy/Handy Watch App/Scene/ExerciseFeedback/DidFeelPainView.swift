//
//  DidFeelPainView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct DidFeelPainView: View {
    @Environment(Coordinator.self) var coordinator
    @Environment(\.modelContext) var context
    @Environment(SwiftDataController.self) var controller
    @Environment(WorkoutController.self) var workoutController
    
    var body: some View {
        VStack{
            
            TitleForm(text: "Sentiu dor ao praticar?")
            Spacer()
            
            HStack (spacing: 30){
                Button {
                    controller.saveNewExercise(context: context)
                    controller.avarageHeartBeats = workoutController.averageHeartRate
                    controller.endTrainning = workoutController.endTrainning
                    controller.maxHeartBeats = workoutController.maxHeartRate
                    controller.minHeartBeats = workoutController.minHeartRate
                    controller.startTrainning = workoutController.startTrainning
                    controller.saveNewExercise(context: context)
                    workoutController.reset()
                    coordinator.navigateToRoot()
                } label: {
                    Image(systemName: "xmark")
                }
                
                Button {
                    coordinator.navigate(to: .painScaleView)
                } label: {
                    Image(systemName: "checkmark")
                }
            }
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("3/3")
            }
        }
    }
}

#Preview {
    NavigationStack {
        DidFeelPainView()
            .environment(Coordinator())
            .environment(SwiftDataController())
    }
}
