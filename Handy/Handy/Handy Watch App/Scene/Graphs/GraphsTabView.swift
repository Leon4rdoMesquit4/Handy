//
//  MonthGraphsTabView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct GraphsTabView: View {
    
    @State var graphCase: Coordinator.Destination.GraphCases
    
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    
    var body: some View {
        TabView{
            PracticeTimeGraphView(graphCase: graphCase)
            
            BPMGraphView(graphCase: graphCase)
            
            FeedbackGraphView(graphCase: graphCase)
            
            DifficultGraphView(graphCase: graphCase)
            
            PainIntensityGraphView(graphCase: graphCase)
        }
        .tabViewStyle(.carousel)
    }
}

#Preview {
    GraphsTabView(graphCase: .month)
}
