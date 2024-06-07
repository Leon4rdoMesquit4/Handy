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
    //Cada indice representa um nível de feedback do menor para o maior
    @State var elements : [Int] = [0, 0, 0, 0, 0, 0]
    @Environment (\.modelContext) var context
    @Environment (SwiftDataController.self) var controller
    @State var plottedElements : [PlottedElement] = []
    @State var text: String = ""
    
    var body: some View {
        VStack {
            BarChart<Int>(plottedElements: $plottedElements, avarage: .constant(0), mainFeeling: $text, linearGradient: LinearGradient(colors: [.feedBackGraphColor1, .feedBackGraphColor2], startPoint: .top, endPoint: .bottom), accentColor: .feedBackGraphColor3)
                .navigationTitle{
                    Text("Como se sentiu")
                        .foregroundStyle(.baseColor1)
                        .font(.poppins(.light, size: 13, relativeTo: .title))
                }
        }
        .onAppear{
            retrieveData()
        }
        
    }
    
    //Retorna os dados tratados para esse tipo de gráfico
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
        
        var painVerifier : Bool = false
        
        var contador : Int = 0
        for element in elements {
            plottedElements.append(PlottedElement(image: "intensity\(contador)", value: element))
            contador += 1
            
            if element != 0 {
                painVerifier = true
            }
        }
        
        if painVerifier{
            text = Feedback.getPainLevel(index: elements.firstIndex(of: elements.max()!)!)
        }
        
    }
    
    //Enum responasável pelas strings e organização por indices
    enum Feedback: String, CaseIterable {
        case facil = "Fácil"
        case ligeiramenteFacil = "Ligeiramente fácil"
        case desconfortavel = "Desconfortável"
        case cansativo = "Cansativo"
        case muitoCansativo = "Muito Cansativo"
        case exaustivo = "Exaustivo"
        case semDificuldade = "Sem dificuldade"
        
        //Retorna a string por indice
        static func getPainLevel(index: Int) -> String{
            if index == 0 {
                facil.rawValue
            } else if index == 1 {
                ligeiramenteFacil.rawValue
            } else if index == 2 {
                desconfortavel.rawValue
            } else if index == 3 {
                cansativo.rawValue
            } else if index == 4 {
                muitoCansativo.rawValue
            } else if index == 5 {
                exaustivo.rawValue
            } else {
                semDificuldade.rawValue
            }
        }
    }
    
}

#Preview {
    FeedbackGraphView()
        .environment(SwiftDataController())
}
