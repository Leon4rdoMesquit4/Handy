//
//  ExerciseDetailView.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct ExerciseStatsView: View {
    
    @Environment(WorkoutController.self) var controller
    
    var body: some View {
        VStack(alignment: .leading){
            TimelineView(MetricsTimelineSchedule(from: controller.builder?.startDate ?? Date(), isPaused: controller.session?.state == .paused)) { context in
                Text("Tempo de Pratica")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TimeView(timePassed:  controller.builder?.elapsedTime(at: context.date) ?? 0)
                    .font(.system(.title,design: .rounded).monospacedDigit().lowercaseSmallCaps())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                
                HStack{
                    Image(systemName: "heart.fill")
                    Text(controller.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ExerciseStatsView()
}
