//
//  SwiftDataController.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation
import SwiftData

@Observable
class SwiftDataController{
    
//    var time : DateComponents?
    var avarageHeartBeats : Double?
    var minHeartBeats : Double?
    var maxHeartBeats : Double?
    var startTrainning : Date?
    var endTrainning: Date?
    var borgScale : Int?
    var painLevel : Double?
    var exerciseFeedback : Int?
    
    func saveNewExercise(context: ModelContext){
        let exercise = Exercise()
        exercise.startTrainning = startTrainning
        exercise.endTrainning = endTrainning
//        exercise.time = getDateComponents()
        exercise.avarageHeartBeats = avarageHeartBeats
        exercise.minHeartBeats = minHeartBeats
        exercise.maxHeartBeats = maxHeartBeats
        exercise.borgScale = borgScale
        exercise.painLevel = painLevel
        exercise.exerciseFeedback = exerciseFeedback
        context.insert(exercise)
    }
    
    func getDateComponents() -> DateComponents{
        if let startTrainning = startTrainning, let endTrainning = endTrainning {
            let components = Calendar.current.dateComponents([.minute,.second], from: startTrainning, to: endTrainning )
            return components
        }
        return Calendar.current.dateComponents([.minute,.second], from: Date())
    }
}
