//
//  BorgScaleGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI
import SwiftData
import Charts

struct FeedbackGraphView: View {
    @State var elements : [Int] = [0, 0, 0, 0, 0, 0]
    @Environment (\.modelContext) var context
    @Environment (SwiftDataController.self) var controller
    @State var plottedElements : [PlottedElement] = []
    
    var body: some View {
        VStack {
            BarChart<Int>(plottedElements: $plottedElements)
                .navigationTitle("Feedback")
        }
        .onAppear{
            
                retrieveData()
            
        }
        
    }
    
    func retrieveData () {
        
        elements = [0, 0, 0, 0, 0, 0]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        for exercise in exercises {
            if let feedback = exercise.exerciseFeedback {
                if Int(feedback) < elements.count {
                    elements[Int(feedback)] += 1
                }
                
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
    FeedbackGraphView()
        .environment(SwiftDataController())
}
