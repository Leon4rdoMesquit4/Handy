//
//  PainIntensityGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct PainIntensityGraphView: View {
    
    @State var exerciseAnalytics = [GraphData<Double>]()
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    @State var graphCase: Coordinator.Destination.GraphCases
    
    var body: some View {
        Text("Hello, World!")
    }
    
}

#Preview {
    PainIntensityGraphView(graphCase: .week)
}
