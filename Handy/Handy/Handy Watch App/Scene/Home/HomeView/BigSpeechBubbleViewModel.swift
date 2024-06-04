//
//  BigSpeechBubbleViewModel.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 03/06/24.
//

import Foundation

extension BigSpeechBubbleView {
    
    class BigSpeechBubbleViewModel : ObservableObject {
        var speechBubbleText : [String] = ["Acredite na sua recuperação.", "Cada passo importa muito.", "Superação é seu destino.", "Determinação é sua aliada.", "Você é mais forte!", "Continue avançando, sem desistir.", "Você pode, você consegue!"]
        
        func selectRandomSpeechBubblePhrase() -> String {
            if let randomPhrase = speechBubbleText.randomElement() {
                return randomPhrase
            } else {
                return ""
            }
        }
    }
}
