//
//  BarChart.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 28/05/24.
//

import SwiftUI
import Charts

struct BarChart<T: Plottable & Hashable>: View {
    /// lista de elementos plotados na tela
    @Binding var plottedElements : [PlottedElement]
    var hasImages: Bool = true
    
    var body: some View {
        Chart (plottedElements, id: \.image) { p in
            BarMark(x: .value("image", p.image), y: .value("value", p.value), width: 10)
                .clipShape(Capsule())
                .foregroundStyle(by: .value("value", p.image))
        }
        .chartLegend(.hidden)
        .chartXAxis(hasImages ? .visible : .hidden)
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartXAxis {
            AxisMarks { val in
                AxisValueLabel {
                    axisImage(val: val.index)
                }
            }
        }
    }
    
    @ViewBuilder
    private func axisImage (val : Int) -> some View {
        Image(plottedElements[val].image)
            .resizable()
            .scaledToFit()
            .frame(width: 15)
            .padding(.vertical)
    }
}

#Preview {
    @State var elementsList = [
        PlottedElement(image: "intensity0", value: 15),
        PlottedElement(image: "intensity1", value: 5),
        PlottedElement(image: "intensity2", value: 5),
        PlottedElement(image: "intensity3", value: 8),
        PlottedElement(image: "intensity4", value: 18),
        PlottedElement(image: "intensity5", value: 5),

    ]
    return BarChart<Int>(plottedElements: $elementsList)
}
