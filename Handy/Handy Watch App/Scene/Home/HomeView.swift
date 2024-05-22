//
//  HomeView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(HomeCoordinator.self) var coordinator
    
    var body: some View {
        VStack{
            Text("Graph")
                .onTapGesture {
                    coordinator.navigate(to: .selectGraphView)
                }
            Text("CountdownView")
                .onTapGesture {
                    coordinator.navigate(to: .countdownView)
                }
        }
    }
}


#Preview {
    HomeView()
        .environment(HomeCoordinator())
}
