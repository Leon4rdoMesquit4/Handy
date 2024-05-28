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
        let lastWeekDays = controller.getLastWeekDaysForPredicate()
        let exercises = controller.fetchExercises(context, in: lastWeekDays.0 ... lastWeekDays.1)
        
        for exercise in exercises {
            if let borgScale = exercise.borgScale {
                elements[borgScale] += 1
            }
        }
    }
    
}

#Preview {
    BorgScaleGraphView()
        .environment(SwiftDataController())
}
