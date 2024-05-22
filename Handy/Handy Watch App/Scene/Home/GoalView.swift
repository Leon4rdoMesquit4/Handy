//
//  GoalView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct GoalView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Minha meta")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    .font(.title3)
                Spacer()
            }
            GoalGraph
            Spacer()
        }.ignoresSafeArea()
    }
}

extension GoalView {
    var GoalProgress: some View {
        VStack {
            Image(systemName: "fork.knife")
                .resizable()
                .frame(width: 40, height: 60)
            HStack {
                Image("face.smiling.inverse")
                Text("65%")
            }
        }
    }
}

extension GoalView {
    var GoalGraph: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.white.opacity(0.2),
                    lineWidth: 25
                )
                .frame(width: 160)
            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round)
                        
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 160)
            GoalProgress
        }
    }
}

#Preview {
    GoalView()
}
