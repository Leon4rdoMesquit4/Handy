//
//  ExerciseControl.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

//Tela de controle de pause e finalização do exercício
struct ExerciseControlView: View {
    @State var progresso : Double = 1
    @State var contador : Int = 3
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    @Environment(WorkoutController.self) var wcontroller
    var endButtonString = String(localized: "Finalizar")
    var pauseButtonString = String(localized: "Pausar")
    var body: some View {
        ZStack{
            Color.base
            
            HStack{
                ControlButton(color: .colorSupport03, action: {
                    wcontroller.endWorkout()
                    controller.startTrainning = .now
                    coordinator.navigate(to: .exerciseUserFeedbackView)
                    
                }, name: endButtonString, image: Image(systemName: "xmark"))
                
                
                ControlButton(color: .brandColor2, action: {
                    
                    wcontroller.togglePause()
                    
                }, name: pauseButtonString, image: Image(systemName: wcontroller.working ? "pause.fill" : "play.fill"))
            }.padding()
        }.ignoresSafeArea()
    }
}

#Preview {
    ExerciseControlView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
