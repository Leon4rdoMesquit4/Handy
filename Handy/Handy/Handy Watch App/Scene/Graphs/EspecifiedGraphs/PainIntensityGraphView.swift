//
//  PainIntensityGraphView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 25/05/24.
//

import SwiftUI

//Gráfico responsável por mostra
struct PainIntensityGraphView: View {
    
    @State var exerciseAnalytics = [GraphData<Double>]()
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    
    //Cada indice representa um nível de dor do menor para o maior
    @State var elements : [Int] = [0, 0, 0]
    @State var plottedElements : [PlottedElement] = []
    @State var text: String = ""
    @State var dataIsBlocked: Bool = false
    
    var body: some View {
        ZStack {
            BarChart<Int>(plottedElements: $plottedElements, avarage: .constant(0), mainFeeling: $text, linearGradient: LinearGradient(colors: [.painIntensityGraphColor2, .painIntensityGraphColor1], startPoint: .bottom, endPoint: .top), accentColor: .painIntensityGraphColor3)
                .navigationTitle{
                    Text("Intensidade da dor")
                        .foregroundStyle(.white)
                        .font(.poppins(.light, size: 13, relativeTo: .title))
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
        .onAppear {
            retrieveData()
        }
    }
    
    //Retorna os dados tratados para esse tipo de gráfico
    private func retrieveData() {
        elements = [0, 0, 0]
        plottedElements = []
        
        let lastWeekDays = controller.getLastWeekDaysForPredicateAllDates()
        let exercises = controller.fetchExercises(context, in: lastWeekDays)
        
        guard exercises.isEmpty != true else {
            dataIsBlocked = true
            return
        }
        
        for exercise in exercises {
            if let feedback = exercise.painLevel {
                //plottedElements.append(PlottedElement(image: "intensity\(feedback)", value: 1))
                elements[Int(feedback)] += 1
            }
        }
        
        var contador : Int = 0
        var painVerifier : Bool = false
        
        for element in elements {
            plottedElements.append(PlottedElement(image: "pain\(contador)", value: element))
            contador += 1
            
            if element != 0 {
                painVerifier = true
            }
        }
        
        if painVerifier{
            text = Pain.getPainLevel(index: elements.firstIndex(of: elements.max()!)!)
        }
    }
    
    //Enum responasável pelas strings e organização por indices
    enum Pain: String, CaseIterable {
        case moderada = "Dor moderada"
        case baixa = "Desconforto"
        case alta = "Dor intensa"
        case semDor = "Sem dor"
        
        //Retorna a string por indice
        static func getPainLevel(index: Int) -> String{
            if index == 0 {
                baixa.rawValue
            } else if index == 1 {
                moderada.rawValue
            } else if index == 2{
                alta.rawValue
            } else {
                semDor.rawValue
            }
        }
    }
    
}

#Preview {
    PainIntensityGraphView()
}
