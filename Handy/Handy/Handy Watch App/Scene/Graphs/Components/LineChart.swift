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
    @Binding var avarage: Double
    @State var linearGradient: LinearGradient
    @State var accentColor: Color
    
    var body: some View {
        
        VStack{
            
            Chart {
                
                ForEach(exerciseAnalytics) { item in
                    LineMark(x: .value("day", item.date),
                             y: .value("bpm", item.value))
                    .foregroundStyle(accentColor)
                    
                    PointMark(x: .value("day", item.date),
                              y: .value("bpm", item.value))
                    .foregroundStyle(accentColor)
                }
                .symbol(.circle)
                
            }
            
            
            .chartYScale(domain: minValue...maxValue)
            
            .chartYAxis{
                AxisMarks(position: .leading) { val in
                    if val.index == 0 {
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 2,
                                                         lineCap: .butt,
                                                         lineJoin: .bevel,
                                                         miterLimit: 1,
                                                         dash: [],
                                                         dashPhase: 1))
                        .offset(x: 0, y: 10)
                        .foregroundStyle(.white)
                    }
                    AxisValueLabel()
                        .font(.alata(.regular, size: 14, relativeTo: .body))
                        .foregroundStyle(.baseColor2)
                        .offset(x: -3, y: 0)
                    
                }
            }
            
            .chartXAxis{
                AxisMarks {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel("")
                }
            }
            
            
            HStack(alignment: .bottom){
                
                Text("\(Int(avarage))")
                    .font(.alata(.regular, size: 28, relativeTo: .headline))
                    .foregroundStyle(accentColor)
                Text("bpm")
                    .font(.poppins(.light, size: 10, relativeTo: .body))
                    .padding(.bottom, 3)
                Spacer()
            }.padding(.leading)
            
        }
        
        .padding(.bottom)
        .padding(.horizontal)
        .padding(.trailing)
        .background(linearGradient)
        .ignoresSafeArea(edges: .bottom)
    }
    
}


