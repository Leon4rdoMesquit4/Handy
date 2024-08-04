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
    @State var avarage: Double = 90
    
    var body: some View {
        VStack{
            LineChart(exerciseAnalytics: $exerciseAnalytics, minValue: $minValue, maxValue: $maxValue, avarage: $avarage, linearGradient: LinearGradient(colors: [.bpmGraphColor2, .bpmGraphColor1], startPoint: .bottom, endPoint: .top), accentColor: .bpmGraphColor3)
                .onAppear{
                    retrieveData()
                    print(exerciseAnalytics)
                }
                
                .navigationTitle{
                    Text("Batimentos")
                        .foregroundStyle(.white)
                        .font(.poppins(.light, size: 13, relativeTo: .title))
                }
                .onAppear{
                    receiveAvarage()
                }
        }
    }
    
    //Retorna os dados tratados para esse tipo de gráfico
    func retrieveData() {
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        exerciseAnalytics = Date.averageValuesByDay(exercises: exercises, keypath: \.avarageHeartBeats)
        
        if !exerciseAnalytics.isEmpty {
            minValue = Exercise.minBPM(analytics: exerciseAnalytics) - 2
            maxValue = Exercise.maxBPM(analytics: exerciseAnalytics) + 2
        }
    }
    
    func receiveAvarage() {
        var values: [Double] = []
        
        guard exerciseAnalytics.isEmpty != true else {
            avarage = 0
            return
        }
        
        exerciseAnalytics.forEach { graph in
            values.append(graph.value)
        }
        
        avarage = values.reduce(0, +) / Double(values.count)
        print(avarage)
    }
    
}


#Preview {
    BPMGraphView(exerciseAnalytics: [])
        .environment(SwiftDataController())
}


    

