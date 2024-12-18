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
    @State var dataIsBlocked: Bool = false
    
    var body: some View {
        ZStack{
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
        
        elements = [0, 0, 0, 0, 0, 0]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        guard exercises.isEmpty != true else {
            dataIsBlocked = true
            return
        }
        
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
            text = Feedback.getFeedbackLevel(index: elements.firstIndex(of: elements.max()!)!)
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
        
        // Retorna a string por índice com localização
        static func getFeedbackLevel(index: Int) -> String {
            switch index {
            case 0:
                return String(localized: String.LocalizationValue(Feedback.facil.rawValue))
            case 1:
                return String(localized: String.LocalizationValue(Feedback.ligeiramenteFacil.rawValue))
            case 2:
                return String(localized: String.LocalizationValue(Feedback.desconfortavel.rawValue))
            case 3:
                return String(localized: String.LocalizationValue(Feedback.cansativo.rawValue))
            case 4:
                return String(localized: String.LocalizationValue(Feedback.muitoCansativo.rawValue))
            case 5:
                return String(localized: String.LocalizationValue(Feedback.exaustivo.rawValue))
            default:
                return String(localized: String.LocalizationValue(Feedback.semDificuldade.rawValue))
            }
        }
    }

    
}

#Preview {
    FeedbackGraphView()
        .environment(SwiftDataController())
}
