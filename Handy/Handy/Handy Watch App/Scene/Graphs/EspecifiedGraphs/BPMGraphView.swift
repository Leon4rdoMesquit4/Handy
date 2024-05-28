//
//  BPMGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI
import Charts

struct BPMGraphView: View {
    
    @State var sampleAnalytics: [Exercise]
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    @State var graphCase: 
        
    var body: some View {
        VStack{
            Chart{
                ForEach(sampleAnalytics) { item in
                    LineMark(x: .value("day", item.startTrainning),
                             y: .value("bpm", item.avarageHeartBeats!))
                    .foregroundStyle(LinearGradient(colors: [.orange, .pink], startPoint: .bottomLeading, endPoint: .topTrailing))
                }
                .symbol(.circle)
            }
            
            
            .chartYScale(domain: Exercise.minBPM(sampleAnalytics: sampleAnalytics)...Exercise.maxBPM(sampleAnalytics: sampleAnalytics))
            
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
                .onAppear{
                    sampleAnalytics = self.controller.fecthLastWeekExercises(context: self.context).sorted(by: {$0.startTrainning < $1.startTrainning})
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                .navigationTitle("Batimentos")
            
        }
    }
    
}

#Preview {
    BPMGraphView(sampleAnalytics: [])
        .environment(SwiftDataController())
}


    

