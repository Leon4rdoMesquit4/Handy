//
//  ExerciseDetailView.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct ExerciseStatsView: View {
    
    @Environment(WorkoutController.self) var wcontroller
    
    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: wcontroller.builder?.startDate ?? Date(),
        isPaused: wcontroller.session?.state == .paused)) { context in
            
            Text("Tempo de Pratica")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TimeView(timePassed: wcontroller.builder?.elapsedTime(at: context.date) ?? 0)
                .font(.system(.title,design: .rounded).monospacedDigit().lowercaseSmallCaps())
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            
            HStack{
                Image(systemName: "heart.fill")
                Text(wcontroller.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
            }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ExerciseStatsView()
}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date
    var isPaused: Bool

    init(from startDate: Date, isPaused: Bool) {
        self.startDate = startDate
        self.isPaused = isPaused
    }

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> AnyIterator<Date> {
        var baseSchedule = PeriodicTimelineSchedule(from: self.startDate,
                                                    by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
        
        return AnyIterator<Date> {
            guard !isPaused else { return nil }
            return baseSchedule.next()
        }
    }
}
