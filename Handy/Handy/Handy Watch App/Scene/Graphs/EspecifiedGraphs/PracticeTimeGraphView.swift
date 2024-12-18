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
    @State var timeAvarage: Double = 0.0
    @State var dataIsBlocked: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                BarChart<Int>(plottedElements: $plottedElements, avarage: $timeAvarage, hasImages: false, mainFeeling: .constant(""), linearGradient: LinearGradient(colors: [.timeGraphColor2, .timeGraphColor1], startPoint: .bottom, endPoint: .top), accentColor: .timeGraphColor3)
                    .onAppear{
                        retrieveData()
                    }
                    .navigationTitle{
                        Text("Tempo de prática")
                            .foregroundStyle(.baseColor2)
                            .font(.poppins(.light, size: 13, relativeTo: .title))
                    }
            }
            if dataIsBlocked {
                Text("Você precisa completar o primeiro exercício da semana para que os dados apareçam.")
                    .font(.poppins(.extraBold,size: 14, relativeTo: .subheadline))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background{
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.69))
                            .ignoresSafeArea()
                    }
            }
        }
    }
    
    //Retorna os dados tratados para esse tipo de gráfico
    func retrieveData () {
        
        var avarage = 0.0
        var count = 0.0
        
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
        
        guard exercises.isEmpty == false else {
            print(exercises.isEmpty)
            dataIsBlocked = true
            return
        }
//        print(exercises)
        
        let calendar = Calendar.current
        
        for exercise in exercises {
            let start = exercise.startTrainning
            let end = exercise.endTrainning
            
//            print("\nStart: \(start)")
            
            let components = calendar.dateComponents([.minute,.second], from: start, to: end)
            let minutos = Double(components.minute!) + (Double(components.second!) / 60)
            
            if minutos != 0 {
                print(minutos)
                avarage += minutos
                count += 1
            }
                        
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
        
        if count != 0{
            timeAvarage = avarage / count
        }
        
    }
    
    //Fomatador de dados para a média de tempo de prática
    struct TimeGraphData {
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
