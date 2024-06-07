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
    @Binding var avarage : Double
    var hasImages: Bool = true
    @Binding var mainFeeling: String
    @State var linearGradient: LinearGradient
    @State var accentColor: Color
    
    var body: some View {
        VStack {
            ZStack {
                Chart (plottedElements, id: \.image) { p in
                    BarMark(x: .value("image", p.image), y: .value("value", p.value), width: 10)
                        .clipShape(.rect(cornerRadii: .init(topLeading: 15, bottomLeading: 0, bottomTrailing: 0, topTrailing: 15)))
                    //                        .foregroundStyle(by: .value("value", p.image))
                        .foregroundStyle(accentColor)
                }
                
                .chartLegend(.hidden)
                //                .chartXAxis(hasImages ? .visible : .hidden)
//                .chartYAxis(hasImages ? .hidden : .visible)
                //        .chartYAxis {
                //            AxisMarks(position: .leading)
                //        }
                .chartXAxis {
                    AxisMarks { val in
                        AxisGridLine()
                        if hasImages{
                            AxisValueLabel {
                                axisImage(val: val.index)
                            }
                        }
                    }
                }
                .chartYAxis{
                    
                    AxisMarks(position: .leading){ val in
                        
                        if val.index == 0 {
                            AxisGridLine(stroke: StrokeStyle(lineWidth: 2,
                                                             lineCap: .butt,
                                                             lineJoin: .bevel,
                                                             miterLimit: 1,
                                                             dash: [],
                                                             dashPhase: 1))
                            .foregroundStyle(.white)
                        }
                        
                        if !hasImages {
                            AxisValueLabel()
                                .font(.alata(.regular, size: 14, relativeTo: .body))
                                .foregroundStyle(.baseColor2)
                                .offset(x: -3, y: 0)
                        } else {
                            AxisValueLabel{
                                Text("")
                            }
                        }
                        
                    }
                }
            }
            if !hasImages{
                HStack(alignment: .bottom){
                    
                    Text("\(Int(avarage))")
                        .font(.alata(.regular, size: 28, relativeTo: .headline))
                        .foregroundStyle(.timeGraphColor3)
                    Text("min")
                        .font(.poppins(.light, size: 10, relativeTo: .body))
                        .padding(.bottom, 3)
                    Spacer()
                }.padding(.leading)
            } else {
                HStack{
                    Text(mainFeeling)
                        .font(.alata(.regular, size: 17, relativeTo: .headline))
                        .foregroundStyle(accentColor)
                    Spacer()
                }.padding(.top, 4)
                    .padding(.leading, 10)
                    .padding(.bottom, 3)
            }
        }
        .padding(.bottom)
        .padding(.horizontal)
        .padding(.trailing)
        .background(linearGradient)
        .ignoresSafeArea(edges: .bottom)
        
        //        .onAppear{
        //            getAvarage()
        //        }
        
        
    }
    
    //facilitador de imagens do gráfico
    @ViewBuilder
    private func axisImage (val : Int) -> some View {
        Image(plottedElements[val].image)
            .resizable()
            .scaledToFit()
            .frame(width: 20)
            .padding(.top)
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
    return BarChart<Int>(plottedElements: $elementsList, avarage: .constant(0), mainFeeling: .constant(""), linearGradient: LinearGradient(colors: [.timeGraphColor2, .timeGraphColor1], startPoint: .bottom, endPoint: .top), accentColor: .timeGraphColor3)
}
