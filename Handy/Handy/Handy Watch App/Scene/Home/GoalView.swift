//
//  GoalView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct GoalView: View {
    var goal: Goal
    var body: some View {
        ZStack {
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
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "pencil.circle.fill")
                        .font(.title2)
                        .padding()
                        .onTapGesture {
                        }
                }
            }.ignoresSafeArea()
        }
    }
}

extension GoalView {
    var GoalProgress: some View {
        VStack {
            Text(goal.emoji)
                .font(.largeTitle)
                .frame(width: 40, height: 60)
            HStack {
                Image(systemName: "face.smiling.inverse")
                Text("\(Int(goal.progress))%")
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
                    lineWidth: 20
                )
                .frame(width: 145)
            Circle()
                .trim(from: 0, to: goal.progress/100)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round)
                        
                )
                .rotationEffect(.degrees(-90))
                .frame(width: 145)
            GoalProgress
        }
    }
}

#Preview {
    GoalView(goal: Goal(name: "", emoji: "🍴", progress: 50))
}
