//
//  Exercise.swift
//  Handy
//
//  Created by Caio Marques on 20/05/24.
//

import Foundation
import SwiftData

@Model
class Exercise {
    
    //Como você se sentiu
    var exerciseFeedback: Double?
    
    //Tempo de prática
    var time : String?
    
    //Batimentos
    var avarageHeartBeats : Double?
    var minHeartBeats : Double?
    var maxHeartBeats : Double?
    var startTrainning : Date
    var endTrainning : Date
    
    //Dificuldade do exercício (ESCALA DE BORG)
    /// Um atributo que indica a escala de Borg do usuário, eu fiz uma pequena validação para saber se o novo valor que ele passou está válido
    var borgScale : Double? {
        willSet {
            if let newValue {
                validateBorgScale(newValue: newValue)
            }
        }
    }
    
    //Intensidade de dor
    /// Um atributo que indica o quanto de dor que a pessoa teve durante o exercício. Caso seja 0, então não teve dor.
    var painLevel : Double? {
        willSet {
            if let newValue {
                validatePainScale(newValue: newValue)
            }
        }
    }
    
    init() {
        startTrainning = .now
        endTrainning = .now
    }
    
    /// Uma função que retorna uma String que vai ser usada em uma Image para trazer uma imagem que represente a quantidade de esforço que o usuário teve durante o exercício (usando a escala de Borg), se o esforço que o usuário fez foi nulo, então ele retorna uma String vazia.
    func returnImageBorgScale () -> String {
        if let exerciseFeedback {
            return "intensity\(Int(exerciseFeedback))"
        } else {
            return ""
        }
    }
    
    /// Uma função que retorna uma string que vai se usada em uma Image para renderizar a imagem que representa a quantidade de dor que o usuário sentiu durante o exercício (se o usuário teve um level de dor nulo ou 0, ele simplesmente retorna uma string vazia)
    func returnImagePainLevel () -> String {
        if let painLevel {
            return "pain\(Int(painLevel))"
        } else {
            return ""
        }
    }
    
    private func validateBorgScale (newValue : Double) {
        if newValue >= 0 && newValue <= 10 {
            self.borgScale = newValue
        } else {
//            print("Valor passado para a escala de Borg do usuário é inválida...")
            self.borgScale = nil
        }
    }
    
    private func validatePainScale (newValue : Double) {
        if newValue >= 0 && newValue <= 10 {
            self.painLevel = newValue
        } else {
//            print("Valor passado para o nível de dor do usuário é inválida...")
            self.painLevel = 0
        }
    }
    
    //Retorna o mínimo de batimentos em um array base de um gráfico
    static func minBPM(analytics: [GraphData<Double>]) -> Double {
        analytics.min(by: {$0.value < $1.value})!.value
    }
    
    //Retorna o máximo de batimentos em um array base de um gráfico
    static func maxBPM(analytics: [GraphData<Double>]) -> Double {
        analytics.max(by: {$0.value < $1.value})!.value
        
    }
}


