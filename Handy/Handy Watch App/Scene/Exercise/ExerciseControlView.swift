//
//  ExerciseControl.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseControlView: View {
    
    @Environment(Coordinator.self) var coordinator

    var body: some View {
        Text("ExerciseControlView")
            .onTapGesture {
                coordinator.navigate(to: .exerciseUserFeedbackView)
            }
        
    }
}

#Preview {
    ExerciseControlView()
        .environment(Coordinator())
}
