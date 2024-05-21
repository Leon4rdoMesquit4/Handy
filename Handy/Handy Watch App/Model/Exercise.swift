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
    var time : String?
    var avarageHeartBeats : Double?
    var minHeartBeats : Double?
    var maxHeartBeats : Double?
    var startTrainning : Date?
    
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
    
    init() {}
    
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
}
