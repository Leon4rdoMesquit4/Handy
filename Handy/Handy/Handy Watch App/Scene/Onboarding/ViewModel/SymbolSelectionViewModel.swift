//
//  EmojiSelecionViewModel.swift
//  Handy Watch App
//
//  Created by Caio Marques on 23/05/24.
//

import Foundation
import SwiftUI

extension SymbolSelectionView {
    class SymbolSelectionViewModel : ObservableObject {
        @Published var alertInvalidEmojiIsPresented : Bool = false
        @Published var symbol : String = ""
        @Published var buttonEnabled : Bool = false
        
        /// Variável que vai representar o símbolo salvo dentro da App Storage
        @AppStorage ("symbol") var symbolAppStorage : String = ""
        
        
        /// Essa função não somente valida o emoji
        func validateEmoji () -> Bool {
            if symbol.count == 0 {
                return false
            } else {
                return true
            }
        }
        
        /// Função que salva o emoji no User Defaults
        func saveEmoji () {
            self.symbol = symbol
            buttonEnabled = true
        }
        
        /// Função que exibe o alerta.
        func showAlertInvalidEmoji () {
            self.alertInvalidEmojiIsPresented = true
        }
    }
}
