//
//  LineChart.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 28/05/24.
//

import SwiftUI
import Charts

struct LineChart: View {
    
    @Binding var exerciseAnalytics: [GraphData<Double>]
    @State var minValue: Double
    @State var maxValue: Double
    
    var body: some View {

        Chart{
            ForEach(exerciseAnalytics) { item in
                LineMark(x: .value("day", item.date),
                         y: .value("bpm", item.value))
                .foregroundStyle(LinearGradient(colors: [.orange, .pink], startPoint: .bottomLeading, endPoint: .topTrailing))
            }
            .symbol(.circle)
        }
        
        .chartYScale(domain: ((Exercise.minBPM(analytics: exerciseAnalytics) ?? minValue) - 1)...((Exercise.maxBPM(analytics: exerciseAnalytics) ?? maxValue)) + 1)
        
        .chartYAxis{
            AxisMarks(position: .leading)
        }
        .chartXAxis{
            AxisMarks {
                AxisGridLine()
                AxisTick()
                AxisValueLabel("")
            }
        }
    }
}

#Preview {
    LineChart(exerciseAnalytics: .constant([GraphData<Double>]()), minValue: 0, maxValue: 5)
}
