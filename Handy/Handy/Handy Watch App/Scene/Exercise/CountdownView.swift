//
//  CountdownView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct CountdownView: View {
    @Environment(Coordinator.self) var coordinator
    @Environment(WorkoutController.self) var workoutController
    @State var counter : Double = 3
    
    var body: some View {
        ZStack{
            
            Color.base
            
            VStack {
                CircularProgressBar(contagem: $counter, contagemMaxima: 3)
                    .overlay(alignment: .center) {
                        Text(Int(counter).description)
                            .font(.title)
                            .bold()
                    }
            }
            .background(Color.base)
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    
                    if self.counter <= 0 {
                        timer.invalidate()
                        coordinator.navigate(to: .exerciseTabView)
                        workoutController.startWorkout()
                    } else {
                        self.counter -= 1
                    }
                    
                }
            })
        }.background(Color.base)
    }
}

#Preview {
    CountdownView()
}
