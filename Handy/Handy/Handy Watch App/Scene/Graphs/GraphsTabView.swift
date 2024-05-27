//
//  MonthGraphsTabView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct GraphsTabView: View {
    
    @State var graphCase: Coordinator.Destination.GraphCases
    
    var body: some View {
        TabView{
            PracticeTimeGraphView()
            
            BPMGraphView()
            
            BorgScaleGraphView()
            
            DifficultyGraphView()
            
            PainIntensityGraphView()
        }
        .tabViewStyle(.carousel)
    }
}

#Preview {
    GraphsTabView(graphCase: .month)
}
