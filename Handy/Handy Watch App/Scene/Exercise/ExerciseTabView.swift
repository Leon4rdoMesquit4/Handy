//
//  ExerciseTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseTabView: View {
    var body: some View {
        TabView(selection: .constant(1)){
            ExerciseControlView()
            
            ExerciseStatsView()
                .tag(1)
        }
        
    }
}

#Preview {
    ExerciseTabView()
}
