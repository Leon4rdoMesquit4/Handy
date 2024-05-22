//
//  ExercisesScrollView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExercisesScrollView: View {
    
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ExercisesScrollView()
        .environment(Coordinator())
}
