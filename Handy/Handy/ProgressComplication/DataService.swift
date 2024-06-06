//
//  DataService.swift
//  Handy Watch App
//
//  Created by Caio Marques on 06/06/24.
//

import Foundation
import SwiftUI

struct DataService {
    @AppStorage ("dateBeginningTreatment", store: UserDefaults(suiteName: "group.Luca.Handy")) var beginningDate : String = "13_05_2024"
    @AppStorage ("dateEndTreatment", store: UserDefaults(suiteName: "group.Luca.Handy")) var endingDate : String = "23_12_2024"
    
    func calculateProgress () -> Double{
        let dateBeginningTreatment = Date.convertStringToDate(beginningDate)
        let dateEndTreatment = Date.convertStringToDate(endingDate)
        
        if let dateEndTreatment, let dateBeginningTreatment {
            let totalTime = dateEndTreatment.timeIntervalSinceReferenceDate - dateBeginningTreatment.timeIntervalSinceReferenceDate
            
            // agora, eu preciso saber a subtração entre agora e a data no início do tratamento
            let alreadyProgressed = Date().timeIntervalSinceReferenceDate - dateBeginningTreatment.timeIntervalSinceReferenceDate
            
            // agora é só dividir um pelo outro e multiplicar por 100 para obter o valor do progresso.
            return (alreadyProgressed / totalTime) * 100
        }
        return 0.0
    }
}
