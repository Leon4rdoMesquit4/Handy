//
//  Exercise.swift
//  Handy
//
//  Created by Caio Marques on 20/05/24.
//

import Foundation
import SwiftData

class Exercise {
    var time : TimeInterval?
    var avarageHeartBeats : Double
    var minHeartBeats : Double
    var maxHeartBeats : Double
    var startTrainning : Date = Date()
    
    /// Um atributo que indica a escala de Borg do usuário, eu fiz uma pequena validação para saber se o novo valor que ele passou está válido
    var borgScale : Int? {
        willSet {
            if let newValue {
                validateBorgScale(newValue: newValue)
            }
        }
    }
    
    /// Um atributo que indica o quanto de dor que a pessoa teve durante o exercício. Caso seja 0, então não teve dor.
    var painLevel : Double {
        willSet {
            validatePainScale(newValue: newValue)
        }
    }
    
    init(borgScale: Int, time: TimeInterval, avarageHeartBeats: Double, minHeartBeats: Double, maxHeartBeats: Double, startTrainning: Date, painLevel: Double) {
        self.time = time
        self.avarageHeartBeats = avarageHeartBeats
        self.minHeartBeats = minHeartBeats
        self.maxHeartBeats = maxHeartBeats
        self.startTrainning = startTrainning
        
        // validando o nível de dor passado pelo usuário, se for válido, ele atribui, se não for válido, então ele atribui 0
        if painLevel >= 0 && painLevel <= 5 {
            self.painLevel = painLevel
        } else {
            self.painLevel = 0
        }
                
        // validando a escala de borg passada pelo usuário, se não for válido, ele atribui o valor nil
        if borgScale >= 0 && borgScale <= 10 {
            self.borgScale = borgScale
        } else {
            self.borgScale = nil
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
}
