//
//  SwiftDataController.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation
import SwiftData

@Observable
class SwiftDataController {
    
    var time: String?
    var avarageHeartBeats: Double?
    var minHeartBeats: Double?
    var maxHeartBeats: Double?
    var startTrainning: Date?
    var endTrainning: Date?
    var borgScale: Double?
    var painLevel: Double?
    var exerciseFeedback: Double?
    
    func saveNewExercise(context: ModelContext){
        let exercise = Exercise()
        if let startTrainning = startTrainning {
            exercise.startTrainning = startTrainning
        }
        if let endTrainning = endTrainning {
            exercise.endTrainning = endTrainning
        }
        exercise.time = time
        exercise.avarageHeartBeats = avarageHeartBeats
        exercise.minHeartBeats = minHeartBeats
        exercise.maxHeartBeats = maxHeartBeats
        exercise.borgScale = borgScale
        exercise.painLevel = painLevel
        exercise.exerciseFeedback = exerciseFeedback
        context.insert(exercise)
        resetElements()
    }
    
    func saveALotOfNewExercise(context: ModelContext){
        var exercises: [Exercise] = []
        
        for n in 0...17 {
            let exercise = Exercise()
            exercise.startTrainning = .now + TimeInterval(74000 * n) - 300000
            exercise.endTrainning = .now + TimeInterval(74000 * n) - 295000 + TimeInterval.random(in: 0...4000)
            exercise.avarageHeartBeats = Double(Int.random(in: 70...112))
            exercise.borgScale = Double(Int.random(in: 1...5))
            exercise.exerciseFeedback = Double(Int.random(in: 0...3))
            exercise.painLevel = Double(Int.random(in: 1...5))
            exercises.append(exercise)
        }
        
        for n in exercises{
            context.insert(n)
        }
        
    }
    
    func saveOneExercise(context: ModelContext){
        let exercise = Exercise()
        exercise.startTrainning = .now + TimeInterval(89000)
        exercise.avarageHeartBeats = Double(Int.random(in: 70...112))
        exercise.borgScale = Double(Int.random(in: 1...5))
        exercise.exerciseFeedback = Double(Int.random(in: 0...3))
        exercise.painLevel = Double(Int.random(in: 1...5))
        context.insert(exercise)
    }
    
    func removeAll(context: ModelContext){
        try! context.delete(model: Exercise.self)
    }
    
    func resetElements() {
        time = nil
        avarageHeartBeats = nil
        minHeartBeats = nil
        maxHeartBeats = nil
        startTrainning = nil
        borgScale = nil
        painLevel = nil
        exerciseFeedback = nil
    }
    
    ///Return the minimum and the maximum day of the current week
    func getLastWeekDaysForPredicate() -> (Date, Date) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date.now)
        let dayOfWeek = calendar.component(.weekday, from: today)
        let dates = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
           .compactMap { calendar.date(byAdding:.day, value: $0 - dayOfWeek, to: today) }
        return (dates[0], dates[6])
    }
    
    ///Return the minimum and the maximum day of the current week
    func getLastWeekDaysForPredicateAllDates() -> [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date.now)
        let dayOfWeek = calendar.component(.weekday, from: today)
        let dates = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
           .compactMap { calendar.date(byAdding:.day, value: $0 - dayOfWeek, to: today) }
        return dates
    }
    
    func fetchExercises (_ context : ModelContext) -> [Exercise] {
        var exercisesFetched : [Exercise] = []
        
        if let exercisesRetrieved = try? context.fetch(FetchDescriptor<Exercise>()) {
            exercisesFetched = exercisesRetrieved
        }
        
        return exercisesFetched
    }
    
    func fetchExercises (_ context : ModelContext, in week: ClosedRange<Date>) -> [Exercise]{
        let totalExercises = fetchExercises(context)
        var exercisesInWeek : [Exercise] = []
        
        for exercise in totalExercises {
            let startTrainning = exercise.startTrainning 
                if week.contains(startTrainning) {
                    exercisesInWeek.append(exercise)
                }
        }
        
        return exercisesInWeek
        
    }
}
