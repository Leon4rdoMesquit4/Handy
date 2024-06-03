//
//  PracticeTimeGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct PracticeTimeGraphView: View {
    
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    @State var plottedElements : [PlottedElement] = []
    
    var body: some View {
        VStack{
            BarChart<Int>(plottedElements: $plottedElements, hasImages: false)
                .onAppear{
                    retrieveData()
                }
                .navigationTitle("Tempo de prática")
        }
    }
    
    func retrieveData () {
        var elements = [TimeGraphData(count: 0, sum: 0),
                        TimeGraphData(count: 0, sum: 0),
                        TimeGraphData(count: 0, sum: 0),
                        TimeGraphData(count: 0, sum: 0),
                        TimeGraphData(count: 0, sum: 0),
                        TimeGraphData(count: 0, sum: 0),
                        TimeGraphData(count: 0, sum: 0)]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        
//        print(lastWeekDays)
        
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
//        print(exercises)
        
        let calendar = Calendar.current
        
        for exercise in exercises {
            let start = exercise.startTrainning 
            let end = exercise.endTrainning
            
//            print("\nStart: \(start)")
            
            let components = calendar.dateComponents([.minute,.second], from: start, to: end)
            let minutos = Double(components.minute!) + (Double(components.second!) / 60)
                        
            for (index, n) in lastWeekDays.enumerated() {
//                print("\(n) - Está é a data que tem e esse é o index = \(index)")
                
                if Calendar.current.isDate(n, equalTo: start, toGranularity:.day) {
                    elements[index].addNewValue(value: minutos)
                }
            }
        }
                
        var realExercises: [PlottedElement] = []
        
        for (index, n) in elements.enumerated() {
            realExercises.append(PlottedElement(image: "\(n) - \(index)", value: Int(n.returnAverage())))
        }
        
        plottedElements = realExercises
        
//        print(plottedElements)
    }
    
    struct TimeGraphData{
        var count: Int
        var sum: Double
        
        func returnAverage() -> Double{
            if sum == 0{
                return 0
            } else {
                return sum / Double(count)
            }
        }
        
        mutating func addNewValue(value: Double){
            count += 1
            sum += value
        }
    }
}

#Preview {
    PracticeTimeGraphView()
}
