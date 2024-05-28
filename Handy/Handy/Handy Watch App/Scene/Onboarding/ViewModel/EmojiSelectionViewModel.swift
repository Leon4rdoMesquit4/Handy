//
//  EmojiSelecionViewModel.swift
//  Handy Watch App
//
//  Created by Caio Marques on 23/05/24.
//

import Foundation
import SwiftUI

extension EmojiSelectionView {
    class EmojiSelectionViewModel : ObservableObject {
        @Published var alertInvalidEmojiIsPresented : Bool = false
        @Published var emoji : String = ""
        @Published var buttonEnabled : Bool = false
        @AppStorage ("emoji") var emojiAppStorage : String = ""
        
        
        /// Essa função não somente valida o emoji
        func validateEmoji () -> Bool {
            if emoji.count == 0 {
                return false
            } else {
                return true
            }
        }
        
        /// Função que salva o emoji no User Defaults
        func saveEmoji () {
            self.emojiAppStorage = emoji
            buttonEnabled = true
        }
        
        /// Função que exibe o alerta.
        func showAlertInvalidEmoji () {
            self.alertInvalidEmojiIsPresented = true
        }
    }
}
