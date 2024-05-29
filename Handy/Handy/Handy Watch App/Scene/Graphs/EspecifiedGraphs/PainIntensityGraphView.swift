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
    @State var elements : [Int] = [0, 0, 0, 0, 0, 0]
    @State var plottedElements : [PlottedElement] = []
    
    var body: some View {
        VStack {
            BarChart<Int>(plottedElements: $plottedElements)
        }
        .onAppear {
            retrieveData()
        }
    }
    
    private func retrieveData() {
        elements = [0, 0, 0, 0, 0, 0]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicate()
        let exercises = controller.fetchExercises(context, in: lastWeekDays.0 ... lastWeekDays.1)
        
        for exercise in exercises {
            if let feedback = exercise.painLevel {
                //plottedElements.append(PlottedElement(image: "intensity\(feedback)", value: 1))
                elements[Int(feedback)] += 1
            }
        }
        
        var contador : Int = 0
        for element in elements {
            plottedElements.append(PlottedElement(image: "intensity\(contador)", value: element))
            contador += 1
        }
    }
    
}

#Preview {
    PainIntensityGraphView(graphCase: .week)
}
