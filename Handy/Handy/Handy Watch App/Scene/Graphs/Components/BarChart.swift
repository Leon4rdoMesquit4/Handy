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
        VStack{
            Chart (plottedElements, id: \.image) { p in
                BarMark(x: .value("image", p.image), y: .value("value", p.value), width: 10)
                    .clipShape(Capsule())
                    .foregroundStyle(by: .value("value", p.image))
            }
                .chartLegend(.hidden)
                .chartXAxis(hasImages ? .visible : .hidden)
                .chartYAxis(hasImages ? .hidden : .visible)
            //        .chartYAxis {
            //            AxisMarks(position: .leading)
            //        }
                .chartXAxis {
                    AxisMarks { val in
                        AxisValueLabel {
                            axisImage(val: val.index)
                        }
                    }
                }
                .chartYAxis{
                    AxisMarks(position: .leading){ val in
                        if !hasImages{
                            AxisValueLabel()
                                .font(.alata(.regular, size: 12, relativeTo: .body))
                        } else {
                            AxisValueLabel{
                                Text("")
                            }
                        }
                        
                    }
                }
            HStack{
                Text("30")
                    .font(.alata(.regular, size: 28, relativeTo: .headline))
                Text("Min")
                    .font(.poppins(.light, size: 10, relativeTo: .body))
                Spacer()
            }
        }.padding()
        .background(LinearGradient(colors: [.timeGraphColor2, .timeGraphColor1], startPoint: .bottom, endPoint: .top))
        .ignoresSafeArea(edges: .bottom)
            
        
        
    }
    
    @ViewBuilder
    private func axisImage (val : Int) -> some View {
        Image(plottedElements[val].image)
            .resizable()
            .scaledToFit()
            .frame(width: 20)
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
