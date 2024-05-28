//
//  HomeTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 21/05/24.
//

import SwiftUI

struct HomeTabView: View {
    var goal: Goal
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                    }
                GoalView(goal: goal)
                    .tabItem {
                    }
                ExercisesScrollView()
                    .tabItem {
                    }
            }
            .tabViewStyle(.carousel)
        }
        
    }
}


#Preview {
    HomeTabView(goal: Goal(name: "", emoji: "🍴", progress: 25))
        .environment(Coordinator())
}
