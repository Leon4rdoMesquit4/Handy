//
//  GoalViewModel.swift
//  Handy Watch App
//
//  Created by Caio Marques on 31/05/24.
//

import Foundation
import WatchKit
import SwiftUI

extension GoalView {
    class GoalViewModel : ObservableObject {
        @AppStorage("emoji") var emoji : String = "figure.walk"
        @AppStorage("dateBeginningTreatment") var beginningTreatmentAppStorage : String = "25_05_2024"
        @AppStorage("dateEndTreatment") var endTreatmentAppStorage : String = "31_05_2024"
        
        @Published var initialTreatmentDate : Date? = nil
        @Published var endingTreatmentDate : Date? = nil
        
        
        func getWatchWidth () -> Double {
            let s = WKInterfaceDevice.current().screenBounds
            return s.width
        }
        
        func configTreatmentDate () {
            
            initialTreatmentDate = Date.convertStringToDate(beginningTreatmentAppStorage)
            endingTreatmentDate = Date.convertStringToDate(endTreatmentAppStorage)
        }
        
        func calculateProgressTreatment () -> Double {
            if let initialTreatmentDate, let endingTreatmentDate {
                //primeiramente eu preciso saber a subtração entre a data final pela inicial
                
                let totalTime = endingTreatmentDate.timeIntervalSinceReferenceDate - initialTreatmentDate.timeIntervalSinceReferenceDate
                
                // agora, eu preciso saber a subtração entre agora e a data no início do tratamento
                let alreadyProgressed = Date().timeIntervalSinceReferenceDate - initialTreatmentDate.timeIntervalSinceReferenceDate
                
                
                // agora é só dividir um pelo outro e multiplicar por 100 para obter o valor do progresso.
                return (alreadyProgressed / totalTime) * 100
            }
            
            return 0
        }
        
        /// Uma função que vai calcular a face que vai ser mostrada do lado do progresso
        /// - returns: um inteiro que representa o progresso, esse inteiro vai ser usado na hora de definir a carinha que vai ser mostrada na tela.
        func calculateProgressFace () -> Int {
            // primeiro passo é calcular o progresso do tratamento
            let progressTreatment = self.calculateProgressTreatment()
            
            // e depois a gente verifica em qual estágio do tratamento o usuário está, eu dividi em 3 e com base no tempo de tratamento (não estou tomando em conta, os outros dados, somente o tempo que ele está no tratamento com relação ao tempo geral de tratamento.
            if progressTreatment >= 0.0 && progressTreatment <= 33.3 {
                return 5
            } else if progressTreatment <= 66.6 {
                return 1
            } else {
                return 0
            }
        }
    }
}
