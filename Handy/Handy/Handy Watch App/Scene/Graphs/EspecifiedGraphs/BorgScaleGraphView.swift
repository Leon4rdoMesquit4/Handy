//
//  BorgScaleGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI
import SwiftData
import Charts

struct BorgScaleGraphView: View {
    @State var elements : [Int] = [0, 0, 0, 0, 0, 0]
    @Environment (\.modelContext) var context
    @Environment (SwiftDataController.self) var controller
    
    var body: some View {
        VStack {
            Chart {
                BarMark(x: .value("cai", "😡"), y: .value("bruno", elements[0]))
                BarMark(x: .value("cai", "😠"), y: .value("bruno", elements[1]))
                BarMark(x: .value("cai", "😐"), y: .value("bruno", elements[2]))
                BarMark(x: .value("cai", "🙂"), y: .value("bruno", elements[3]))
            }
        }
        .onAppear(perform: {
            retrieveData()
        })
        
    }
    
    func retrieveData () {
        let lastWeekDays = getLastWeekDaysForPredicate()
        let exercises = controller.fetchExercises(context, in: lastWeekDays.0 ... lastWeekDays.1)
        
        for exercise in exercises {
            if let borgScale = exercise.borgScale {
                elements[borgScale] += 1
            }
        }
    }
    
    
    func getLastWeekDaysForPredicate() -> (Date, Date) {
           let calendar = Calendar.current
           let today = calendar.startOfDay(for: Date.now)
           let dayOfWeek = calendar.component(.weekday, from: today)
           let dates = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
              .compactMap { calendar.date(byAdding:.day, value: $0 - dayOfWeek, to: today) }
           return (dates[0], dates[6])
    }
}

#Preview {
    BorgScaleGraphView()
}
