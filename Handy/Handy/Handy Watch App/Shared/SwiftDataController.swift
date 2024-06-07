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
    
    //Criar um novo exercicio com as variáveis alteradas no controller
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
    
    //Criar varios novos exercicios com variaveis sample
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
    
    //Segunda função criar varios novos exercicios com variaveis sample
    func saveNewExercises(context: ModelContext){
                
        for n in 2...25 {
            
            let components = DateComponents(year: 2024, month: 6, day: n, hour: 14, minute: 30, second: 0)
            guard let inicialDate = Calendar.current.date(from: components) else {
                fatalError("Não foi possível criar a data")
            }
            
            let finalComponents = DateComponents(year: 2024, month: 6, day: n, hour: 14, minute: 30 + Int.random(in: 10...50), second: 0)
            guard let finalDate = Calendar.current.date(from: finalComponents) else {
                fatalError("Não foi possível criar a data")
            }
            
            let exercise = Exercise()
            exercise.startTrainning = inicialDate
            exercise.endTrainning = finalDate
            exercise.avarageHeartBeats = Double(Int.random(in: 70...112))
            exercise.exerciseFeedback = Double(Int.random(in: 0...5))
            exercise.painLevel = Double(Int.random(in: 0...2))
            context.insert(exercise)
            
        }
 
    }
    
    //Terceira função criar novo exercicio com variaveis sample
    func saveOneExercise(context: ModelContext){
        let exercise = Exercise()
        exercise.startTrainning = .now + TimeInterval(89000)
        exercise.avarageHeartBeats = Double(Int.random(in: 70...112))
        exercise.borgScale = Double(Int.random(in: 1...5))
        exercise.exerciseFeedback = Double(Int.random(in: 0...3))
        exercise.painLevel = Double(Int.random(in: 1...5))
        context.insert(exercise)
    }
    
    //Função para remover todos os elementos do swift data
    func removeAll(context: ModelContext){
        try! context.delete(model: Exercise.self)
    }
    
    //Reiniciar os elementos da controller para uma nova instância
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
    
    //Função responsável por fazer as requisições dos elementos existentes no swift data
    func fetchExercises (_ context : ModelContext) -> [Exercise] {
        var exercisesFetched : [Exercise] = []
        
        if let exercisesRetrieved = try? context.fetch(FetchDescriptor<Exercise>()) {
            exercisesFetched = exercisesRetrieved
        }
        
        return exercisesFetched
    }
    
    //Função responsável por fazer as requisições dos elementos existentes no swift data
    func fetchExercises (_ context : ModelContext, in week: [Date]) -> [Exercise]{
        let totalExercises = fetchExercises(context)
        var exercisesInWeek : [Exercise] = []
        
        for exercise in totalExercises {
                        
            print("Exercicio = \(exercise.startTrainning)")
            
            let startTrainning = exercise.startTrainning
            
            for day in week {
                if Calendar.current.isDate(day, equalTo: startTrainning, toGranularity: .day) {
                    exercisesInWeek.append(exercise)
                }
            }
        
        }
        
        print("Dados tratados")
        
        for n in exercisesInWeek{
            print("Exercicio = \(n.startTrainning)")
        }
        
        return exercisesInWeek
        
    }
}
