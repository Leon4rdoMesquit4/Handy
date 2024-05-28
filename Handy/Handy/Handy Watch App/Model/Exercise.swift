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
    
    var exerciseFeedback: Int?
    var time : String?
    var avarageHeartBeats : Double?
    var minHeartBeats : Double?
    var maxHeartBeats : Double?
    var startTrainning : Date
    
    /// Um atributo que indica a escala de Borg do usuário, eu fiz uma pequena validação para saber se o novo valor que ele passou está válido
    var borgScale : Int? {
        willSet {
            if let newValue {
                validateBorgScale(newValue: newValue)
            }
        }
    }
    
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
    }
    
    /// Uma função que retorna uma String que vai ser usada em uma Image para trazer uma imagem que represente a quantidade de esforço que o usuário teve durante o exercício (usando a escala de Borg), se o esforço que o usuário fez foi nulo, então ele retorna uma String vazia.
    func returnImageBorgScale () -> String {
        if let borgScale {
            return "borgScale\(borgScale)"
        } else {
            return ""
        }
    }
    
    /// Uma função que retorna uma string que vai se usada em uma Image para renderizar a imagem que representa a quantidade de dor que o usuário sentiu durante o exercício (se o usuário teve um level de dor nulo ou 0, ele simplesmente retorna uma string vazia)
    func returnImagePainScale () -> String {
        if let painLevel {
            if painLevel == 0 {
                return ""
            } else {
                return "pain\(painLevel)"
            }
        } else {
            return ""
        }
    }
    
    private func validateBorgScale (newValue : Int) {
        if newValue >= 0 && newValue <= 10 {
            self.borgScale = newValue
        } else {
            print("Valor passado para a escala de Borg do usuário é inválida...")
            self.borgScale = nil
        }
    }
    
    private func validatePainScale (newValue : Double) {
        if newValue >= 0 && newValue <= 10 {
            self.painLevel = newValue
        } else {
            print("Valor passado para o nível de dor do usuário é inválida...")
            self.painLevel = 0
        }
    }
    
    static func minBPM(sampleAnalytics: [Exercise]) -> Double {
        return sampleAnalytics.min(by: {$0.avarageHeartBeats! < $1.avarageHeartBeats!})!.avarageHeartBeats!
    }
    
    static func maxBPM(sampleAnalytics: [Exercise]) -> Double {
        return sampleAnalytics.max(by: {$0.avarageHeartBeats! < $1.avarageHeartBeats!})!.avarageHeartBeats!
    }
}


