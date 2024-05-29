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
    
    var time : DateComponents?
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
        exercise.secondsExercise = getSecondsExercise()
        exercise.avarageHeartBeats = avarageHeartBeats
        exercise.minHeartBeats = minHeartBeats
        exercise.maxHeartBeats = maxHeartBeats
        exercise.borgScale = borgScale
        exercise.painLevel = painLevel
        exercise.exerciseFeedback = exerciseFeedback
        context.insert(exercise)
        resetElements()
    }
    
    func resetElements(){
//        time = ""
        avarageHeartBeats = 0.0
        minHeartBeats = 0.0
        maxHeartBeats = 0.0
        startTrainning = .now
        borgScale = 0
        painLevel = 0.0
        exerciseFeedback = 0
    }
    
    /// Função que retorna a quantidade de segundos que o usuário passou fazendo o exercício,
    private func getSecondsExercise () -> Int {
        let componentes = getDateComponents()
        let segundos = (componentes.second ?? 0) * 1
        let minutosParaSegundos = (componentes.minute ?? 0) * 60
        let horasParaSegundos = (componentes.hour ?? 0) * 360
        
        return horasParaSegundos + minutosParaSegundos + segundos
    }
    
    func getDateComponents() -> DateComponents{
        if let startTrainning = startTrainning, let endTrainning = endTrainning {
            let components = Calendar.current.dateComponents([.minute,.second], from: startTrainning, to: endTrainning )
            return components
        }
        return Calendar.current.dateComponents([.minute,.second], from: Date())
    }
    
    // MARK: FUNÇÕES DO CAI PARA RECUPERAR DADOS DO BANCO DE DADOS LOCAL DO USER.
    
    /// Uma função que retorna todos os registros de Exercise salvos no banco de dados local do usuário.
    func fetchData (_ context : ModelContext) -> [Exercise] {
        var returnedExercises : [Exercise] = []
        
        // pegando os dados
        do {
            returnedExercises = try context.fetch(FetchDescriptor<Exercise>())
        } catch {
            print("Erro na hora de recuperar os dados")
        }
        
        return returnedExercises
    }
    
    /// Uma função que retorna todos os registros de Exercise salvos no banco de dados local do usuário em um determinado intervalo de tempo.
    func fetchData (_ context : ModelContext, in range: ClosedRange<Date>) -> [Exercise] {
        var returnedExercises : [Exercise] = []
        var allExercises = fetchData(context)
        for exercise in allExercises {
            if let startTrainning = exercise.startTrainning {
                if range.contains(startTrainning) {
                    returnedExercises.append(exercise)
                }
            }
        }
        return returnedExercises
    }
}
