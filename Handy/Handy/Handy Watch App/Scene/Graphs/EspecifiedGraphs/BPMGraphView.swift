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
            LineChart()
                .onAppear{
                    switch graphCase {
                    case .month:
                        exerciseAnalytics = []
                    case .week:
                        retrieveData()
                    }
                    
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                .navigationTitle("Batimentos")
        }
    }
    
    @ViewBuilder
    func LineChart() -> some View {
        Chart{
            ForEach(exerciseAnalytics) { item in
                LineMark(x: .value("day", item.date),
                         y: .value("bpm", item.value))
                .foregroundStyle(LinearGradient(colors: [.orange, .pink], startPoint: .bottomLeading, endPoint: .topTrailing))
            }
            .symbol(.circle)
        }
        
        .chartYScale(domain: Exercise.minBPM(analytics: exerciseAnalytics)...Exercise.maxBPM(analytics: exerciseAnalytics))
        
        .chartYAxis{
            AxisMarks(position: .leading)
        }
        //        .chartYAxis(.hidden)
        .chartXAxis{
            AxisMarks {
                AxisGridLine()
                AxisTick()
                AxisValueLabel("")
            }
        }
    }
    
    func retrieveData () {
        let lastWeekDays = controller.getLastWeekDaysForPredicate()
        let exercises = controller.fetchExercises(context, in: lastWeekDays.0 ... lastWeekDays.1)
        
        exerciseAnalytics = Date.averageValuesByDay(exercises: exercises)
    }
    
}



#Preview {
    
    BPMGraphView(exerciseAnalytics: [], graphCase: .week)
        .environment(SwiftDataController())
}


    

