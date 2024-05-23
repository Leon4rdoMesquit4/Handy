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
    
    var body: some View {
        VStack {
            Text("Touch her for next view")
                .onTapGesture {
                    coordinator.navigate(to: .exerciseUserFeedbackView)
                }
            
        }
        
    }
}

#Preview {
    ExerciseControlView()
}
