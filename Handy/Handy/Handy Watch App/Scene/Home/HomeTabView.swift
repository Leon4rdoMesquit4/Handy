//
//  HomeTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 21/05/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                    }
                GoalView()
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
    HomeTabView()
}
