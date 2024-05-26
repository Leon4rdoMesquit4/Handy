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
    
    var time : String?
    var avarageHeartBeats : Double?
    var minHeartBeats : Double?
    var maxHeartBeats : Double?
    var startTrainning : Date?
    var borgScale : Int?
    var painLevel : Double?
    var exerciseFeedback : Int?
    
    func saveNewExercise(context: ModelContext){
        let exercise = Exercise()
        exercise.startTrainning = startTrainning
        exercise.time = time
        exercise.avarageHeartBeats = avarageHeartBeats
        exercise.minHeartBeats = minHeartBeats
        exercise.maxHeartBeats = maxHeartBeats
        exercise.borgScale = borgScale
        exercise.painLevel = painLevel
        exercise.exerciseFeedback = exerciseFeedback
        context.insert(exercise)
    }
    
}
