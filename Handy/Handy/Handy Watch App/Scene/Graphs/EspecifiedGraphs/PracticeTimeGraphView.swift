//
//  PracticeTimeGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

struct PracticeTimeGraphView: View {
    
    @State var elements : [Int] = [0, 0, 0, 0, 0, 0, 0]
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    @State var graphCase: Coordinator.Destination.GraphCases
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
                        TimeGraphData(count: 0, sum: 0),]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays[0] ... lastWeekDays[6])
        
        for n in exercises{
            print(n.startTrainning)
            print(n.endTrainning)
        }
        
        
        let calendar = Calendar.current
        
        for exercise in exercises {
            let start = exercise.startTrainning 
            let end = exercise.endTrainning
            
//            print(start)
//            print(end)
            
            let components = calendar.dateComponents([.minute,.second], from: start, to: end)
            let minutos = Double(components.minute!) + (Double(components.second!) / 60)
            
            for (index, n) in lastWeekDays.enumerated() {
                if Calendar.current.isDate(n, equalTo: start, toGranularity:.day) {
                    elements[index].addNewValue(value: minutos)
                    
                    print("\(n) == \(start) || \(start) - \(end) == \(minutos)")
                }
            }
        }
        
        print(elements)
        
        var realExercises: [PlottedElement] = []
        
        for (index, n) in elements.enumerated() {
            realExercises.append(PlottedElement(image: "\(n)", value: Int(n.returnAverage())))
        }
        
        plottedElements = realExercises
        
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
    PracticeTimeGraphView(graphCase: .week)
}
