//
//  BorgScaleGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI
import SwiftData
import Charts

struct FeedbackGraphView: View {
    @State var elements : [Int] = [0, 0, 0, 0]
    @Environment (\.modelContext) var context
    @Environment (SwiftDataController.self) var controller
    @State var graphCase: Coordinator.Destination.GraphCases
    
    var body: some View {
        VStack {
            BarChart(elements: $elements, emojis: ["😡", "😠", "😐", "🙂"])
            .navigationTitle("Como se sentiu")
        }
        .onAppear{
            switch graphCase {
            case .month:
                elements = [0, 0, 0, 0]
            case .week:
                retrieveData()
            }
        }
        
    }
    
    func retrieveData () {
        let lastWeekDays = controller.getLastWeekDaysForPredicate()
        let exercises = controller.fetchExercises(context, in: lastWeekDays.0 ... lastWeekDays.1)
        
        for exercise in exercises {
            if let feedback = exercise.exerciseFeedback {
                elements[Int(feedback)] += 1
            }
        }
    }
    
}

#Preview {
    FeedbackGraphView(graphCase: .week)
        .environment(SwiftDataController())
}
