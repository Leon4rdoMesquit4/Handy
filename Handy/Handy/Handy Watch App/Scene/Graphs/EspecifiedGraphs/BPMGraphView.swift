//
//  BPMGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI
import Charts

struct BPMGraphView: View {
    
    @State var exerciseAnalytics = [GraphData<Double>]()
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    @State var graphCase: Coordinator.Destination.GraphCases
    
    var body: some View {
        VStack{
            LineChart(exerciseAnalytics: $exerciseAnalytics, minValue: 70, maxValue: 90)
                .onAppear{
                    switch graphCase {
                    case .month:
                        exerciseAnalytics = []
                    case .week:
                        retrieveData()
                    }
                    
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                .navigationTitle("Batimentos")
        }
    }
    
    func retrieveData () {
        let lastWeekDays = controller.getLastWeekDaysForPredicate()
        let exercises = controller.fetchExercises(context, in: lastWeekDays.0 ... lastWeekDays.1)
        
        exerciseAnalytics = Date.averageValuesByDay(exercises: exercises, keypath: \.avarageHeartBeats)
        print(exerciseAnalytics)
    }
    
}


#Preview {
    BPMGraphView(exerciseAnalytics: [], graphCase: .week)
        .environment(SwiftDataController())
}


    

