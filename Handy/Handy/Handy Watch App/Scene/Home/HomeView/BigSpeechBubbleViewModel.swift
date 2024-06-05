//
//  BigSpeechBubbleViewModel.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 03/06/24.
//

import Foundation

//enum criado para a passagem de dados que define a orientação da BigSpeechBubbleView
enum SpeechBubbleOrientation {
    case left
    case right
}

class BigSpeechBubbleViewModel : ObservableObject {
    
    //Parâmetro que define a orientação da BigSpeechBubbleView
    var orientation: SpeechBubbleOrientation
    var speechBubbleText : [String] = ["Acredite na sua recuperação.", "Cada passo importa muito.", "Superação é seu destino.", "Determinação é sua aliada.", "Você é mais forte!", "Continue avançando, sem desistir.", "Você pode, você consegue!"]
    
    init(orientation: SpeechBubbleOrientation) {
        self.orientation = orientation
    }
    
    //Função que retorna uma frase aleatória
    func selectRandomSpeechBubblePhrase() -> String {
        if let randomPhrase = speechBubbleText.randomElement() {
            return randomPhrase
        } else {
            return ""
        }
    }
}

