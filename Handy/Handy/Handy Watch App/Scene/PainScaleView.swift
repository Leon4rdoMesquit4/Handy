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
    @Environment(WorkoutController.self) var wcontroller
    @Environment(\.modelContext) var context
    
    var body: some View {
        ZStack{
            VStack{
                TitleForm(text: "Qual a intensidade da dor?")
                Spacer()
                StepperImage(value: $painIntensity, interval: 0 ... 2, prefixImage: "pain")
                
                painScaleLabel()
                    .font(.caption)
                
                ButtonNextPage{
                    
                    controller.painLevel = Double(painIntensity)
                    controller.avarageHeartBeats = wcontroller.averageHeartRate
                    controller.maxHeartBeats = wcontroller.maxHeartRate
                    controller.minHeartBeats = wcontroller.minHeartRate
                    controller.startTrainning = wcontroller.startTrainning
                    controller.endTrainning = wcontroller.endTrainning
                    controller.time = wcontroller.time
                    controller.saveNewExercise(context: context)
                    wcontroller.reset()
                    coordinator.navigateToRoot()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("3/3")
                }
            }
        }.background(Color.base)
    }
    
    
    func painScaleLabel () -> Text {
        var painLabel : String = ""
        
        switch painIntensity {
        case 0: painLabel = "Pouca dor"
        case 1: painLabel = "Dor moderada"
        case 2: painLabel = "Muita dor"
        default: break
        }
        
        return Text(painLabel)
    }
}

#Preview {
    NavigationStack {
        PainScaleView()
            .environment(Coordinator())
            .environment(SwiftDataController())
    }
}
