//
//  ExerciseTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseTabView: View {
    
    @Binding var isExercising: Bool
//    @Binding var exerciseCoordinator: Bool
    
    var body: some View {
        ZStack{
            
            TabView(){
                ExerciseControlView()
                    .tabItem {  }
                
                ExerciseStatsView()
                    .tabItem {  }
            }.tabViewStyle(.carousel)
            .navigationBarBackButtonHidden()
        }
    }
    
}

#Preview {
    ExerciseTabView(isExercising: .constant(true))
}
