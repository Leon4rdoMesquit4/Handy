//
//  HomeView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        ZStack {
            Image("Fennec")
                .resizable()
                .frame(width: 200, height: 230)
            VStack {
                HStack {
                    Image(systemName: "chart.bar.xaxis")
                        .padding(12)
                        .onTapGesture {
                            coordinator.navigate(to: .selectGraphView)
                        }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image(systemName: "plus.message.fill")
                        .padding(.trailing, 10)
                        .onTapGesture {
                            coordinator.navigate(to: .countdownView)
                        }
                }
                Spacer()
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
        .environment(Coordinator())
}
