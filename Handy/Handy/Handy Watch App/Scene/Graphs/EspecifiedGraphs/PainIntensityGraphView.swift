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
    @State var elements : [Int] = [0, 0, 0]
    @State var plottedElements : [PlottedElement] = []
    
    var body: some View {
        ZStack {
            BarChart<Int>(plottedElements: $plottedElements)
                .navigationTitle("Dor")
        }
        .onAppear {
            retrieveData()
        }
    }
    
    private func retrieveData() {
        elements = [0, 0, 0]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        for exercise in exercises {
            if let feedback = exercise.painLevel {
                //plottedElements.append(PlottedElement(image: "intensity\(feedback)", value: 1))
                elements[Int(feedback)] += 1
            }
        }
        
        var contador : Int = 0
        for element in elements {
            plottedElements.append(PlottedElement(image: "pain\(contador)", value: element))
            contador += 1
        }
    }
    
}

#Preview {
    PainIntensityGraphView()
}
