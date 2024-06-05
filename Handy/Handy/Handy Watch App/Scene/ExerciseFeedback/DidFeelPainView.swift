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
    @Environment(WorkoutController.self) var wcontroller
     
    var body: some View {
        ZStack{
            
            Color.base
            
            VStack{
                
                TitleForm(text: "Sentiu dor ao praticar?")
                Spacer()
                
                HStack (spacing: 15){
                    Button {
                        controller.startTrainning = wcontroller.startTrainning
                        controller.endTrainning = wcontroller.endTrainning
                        controller.avarageHeartBeats = wcontroller.averageHeartRate
                        controller.maxHeartBeats = wcontroller.maxHeartRate
                        controller.minHeartBeats = wcontroller.minHeartRate
                        controller.time = wcontroller.time
                        controller.saveNewExercise(context: context)
                        wcontroller.reset()
                        coordinator.navigateToRoot()
                    } label: {
                        Image(systemName: "xmark")
                            .bold()
                            .foregroundStyle(.base)
                    }
                    .background(Color.colorSupport03)
                    .frame(height: 40)
                    .clipShape(Capsule())
                    
                    Button {
                        coordinator.navigate(to: .painScaleView)
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.base)
                            .bold()
                    }
                    .background(Color.colorSupport02)
                    .frame(height: 40)
                    .clipShape(Capsule())
                    
                }
                
                Spacer()
            }
            .background(Color.base)
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("2/3")
                }
            }
        }.background(Color.base)
    }
}

#Preview {
    NavigationStack {
        DidFeelPainView()
            .environment(Coordinator())
            .environment(SwiftDataController())
    }
}
