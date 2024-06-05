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
            LineChart(exerciseAnalytics: $exerciseAnalytics, minValue: $minValue, maxValue: $maxValue, avarage: .constant(90), linearGradient: LinearGradient(colors: [.bpmGraphColor2, .bpmGraphColor1], startPoint: .bottom, endPoint: .top), accentColor: .bpmGraphColor3)
                .onAppear{
                    retrieveData()
                }
                
                .navigationTitle{
                    Text("Batimentos")
                        .foregroundStyle(.white)
                        .font(.poppins(.light, size: 13, relativeTo: .title))
                }
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


    

