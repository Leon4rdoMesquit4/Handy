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
    @Binding var minValue: Double
    @Binding var maxValue: Double
    
    var body: some View {

        Chart{
            ForEach(exerciseAnalytics) { item in
                LineMark(x: .value("day", item.date),
                         y: .value("bpm", item.value))
                .foregroundStyle(LinearGradient(colors: [.orange, .pink], startPoint: .bottomLeading, endPoint: .topTrailing))
            }
            .symbol(.circle)
        }
        
        .chartYScale(domain: minValue...maxValue)
        
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
    LineChart(exerciseAnalytics: .constant([GraphData<Double>]()), minValue: .constant(0), maxValue: .constant(5))
}
