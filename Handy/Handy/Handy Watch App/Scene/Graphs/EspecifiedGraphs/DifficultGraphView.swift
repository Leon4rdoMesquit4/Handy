//
//  DifficultyGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct DifficultGraphView: View {
    
    @State var exerciseAnalytics = [GraphData<Double>]()
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    @State var graphCase: Coordinator.Destination.GraphCases
    
    var body: some View {
        VStack{
//            LineChart(exerciseAnalytics: $exerciseAnalytics, minValue: .constant(1), maxValue: .constant(5))
//                .onAppear{
//                    switch graphCase {
//                    case .month:
//                        exerciseAnalytics = []
//                    case .week:
//                        retrieveData()
//                    }
//                }
//                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
//                .navigationTitle("Dificuldade")
        }
    }
    
    func retrieveData () {
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        exerciseAnalytics = Date.averageValuesByDay(exercises: exercises, keypath: \.borgScale)
        print(exerciseAnalytics)
    }
    
}

#Preview {
    DifficultGraphView(graphCase: .week)
        .environment(SwiftDataController())
}
