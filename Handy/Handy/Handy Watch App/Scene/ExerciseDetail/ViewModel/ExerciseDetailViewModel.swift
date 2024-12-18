//
//  ExerciseDetailViewModel.swift
//  Handy Watch App
//
//  Created by Caio Marques on 21/05/24.
//

import Foundation

extension ExerciseDetailView {
    
    class ExerciseDetailViewModel : ObservableObject {
        @Published var exercise : Exercise? = nil
        
        func config(exercise: Exercise) {
            self.exercise = exercise
        }
        
        func makeSharedText () -> String {
            if let exercise {
                
                let dayExercise = String(localized :"Treino do dia: \(exercise.startTrainning.formatted(date: .numeric, time: .omitted))")
                let avarageHeartbeat = String(localized:"Minha taxa de batimento cardíaco média foi \(Int(exercise.avarageHeartBeats ?? 0).description) bpm")
                let painLevels = String(localized:"\(exercise.painLevel != 0 ? "Meu nível de dor foi: \(Int(exercise.painLevel ?? 1).description)/10": "Eu não senti dor durante o exercício")")
                let intensityLevels = String(localized:"A intensidade do exercício marcada pela escala de Borg foi de \(exercise.borgScale ?? 0)/10")
                
                
                return """
                    \(dayExercise)\n\n
                    \(avarageHeartbeat)\n\n
                    \(painLevels)\n\n
                    \(intensityLevels)
                    """
            } else {
                return ""
            }
        }
    }
    
    
}
