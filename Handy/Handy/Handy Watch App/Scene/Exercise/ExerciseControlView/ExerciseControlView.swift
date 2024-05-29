//
//  ExerciseControl.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseControlView: View {
    @State var progresso : Double = 1
    @State var contador : Int = 3
    @Environment(Coordinator.self) var coordinator
    @Environment(WorkoutController.self) var wcontroller
    @Environment(SwiftDataController.self) var controller
    
    var body: some View {
        HStack{
            ControlButton(color: .gray, action: {
                
                wcontroller.endWorkout()
                controller.startTrainning = .now
                coordinator.navigate(to: .exerciseUserFeedbackView)
                
            }, name: "end", image: Image(systemName: "xmark"))
            
            
            ControlButton(color: .gray, action: {
                
                wcontroller.togglePause()
                
            }, name: "Pausar", image: Image(systemName: "pause.fill"))
        }
    }
}

#Preview {
    ExerciseControlView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
