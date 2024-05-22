//
//  ContentView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 17/05/24.
//

import SwiftUI

struct HomeTabView: View {
    
    var body: some View {
        
        TabView(){
            HomeView()
                .tabItem {  }
            
            GoalView()
                .tabItem {  }
            
            ExercisesScrollView()
                .tabItem {  }
            
        }.tabViewStyle(.carousel)
            .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    HomeTabView()
}
