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
    @State var minValue: Double = 70
    @State var maxValue: Double = 90
    
    var body: some View {
        VStack{
            LineChart(exerciseAnalytics: $exerciseAnalytics, minValue: $minValue, maxValue:  $maxValue)
                .onAppear{
                    retrieveData()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                .navigationTitle("Batimentos")
        }
    }
    
    func retrieveData() {
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        exerciseAnalytics = Date.averageValuesByDay(exercises: exercises, keypath: \.avarageHeartBeats)
        
        if !exerciseAnalytics.isEmpty {
            minValue = Exercise.minBPM(analytics: exerciseAnalytics) - 2
            maxValue = Exercise.maxBPM(analytics: exerciseAnalytics) + 2
        }
    }
    
}


#Preview {
    BPMGraphView(exerciseAnalytics: [])
        .environment(SwiftDataController())
}


    

