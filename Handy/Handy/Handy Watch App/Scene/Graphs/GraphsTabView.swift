//
//  MonthGraphsTabView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct GraphsTabView: View {
        
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    
    var body: some View {
        TabView{
            PracticeTimeGraphView()
            
            BPMGraphView()
            
            FeedbackGraphView()
            
//            DifficultGraphView(graphCase: graphCase)
            
            PainIntensityGraphView()
        }
        .tabViewStyle(.carousel)
    }
}

#Preview {
    GraphsTabView()
}
