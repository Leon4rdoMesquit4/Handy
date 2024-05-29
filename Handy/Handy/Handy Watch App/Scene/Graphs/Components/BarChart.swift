//
//  BarChart.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 28/05/24.
//

import SwiftUI
import Charts

struct BarChart<T: Plottable & Hashable>: View {
    
    @Binding var elements : [T]
    @State var emojis: [String]?
    
    var body: some View {
        Chart {
            ForEach(Array(elements.enumerated()), id: \.offset) { index, value in
                BarMark(x: .value("emoji", "\(emojis?[index] ?? "")"), y: .value("value", value))
            }
        }
        .chartYAxis{
            AxisMarks(position: .leading)
        }
    }
}

#Preview {
    BarChart<Int>(elements: .constant([Int]()) )
}
