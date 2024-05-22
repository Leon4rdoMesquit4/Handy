//
//  ExerciseTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct ExerciseTabView: View {
    
    @Environment(Coordinator.self) var coordinator
    @State var exerciseIsFinished: Bool = false
    
    var body: some View {
        ZStack{
            
            TabView(selection: .constant(1)){
                ExerciseControlView()
                    .environment(coordinator)
                    .tabItem {  }
                
                ExerciseStatsView()
                    .tabItem {  }
                    .tag(1)
            }
            .navigationBarBackButtonHidden()
            
        }
    }
}

#Preview {
    ExerciseTabView()
}
