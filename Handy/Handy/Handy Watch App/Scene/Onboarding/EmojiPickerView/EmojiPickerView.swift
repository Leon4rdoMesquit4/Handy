//
//  EmojiPickerView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 23/05/24.
//

import SwiftUI

/// Uma view que vai servir para permitir com qu eo usuário consiga escolher um SF Symbol para representar a sua meta dentro do aplicativo
struct EmojiPickerView: View {
    @Binding var emojiPicked : String
    @Environment (\.dismiss) var dismiss
    
    /// Um array que determina as colunas do LazyVGrid abaixo.
    var columns : [GridItem] = [
        GridItem(.fixed(35)),
        GridItem(.fixed(35)),
        GridItem(.fixed(35)),
        GridItem(.fixed(35)),
    ]
    
    // MARK: BODY
    var body: some View {
        VStack (spacing: 20){
            Text("Escolha um símbolo")
            
            // aqui é onde é exibida a lista de símbolos. É uma LazyVGrid com 5 colunas
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(physiotherapyGoalsEmojis, id: \.self) { symbol in
                        Image(systemName: symbol)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                            .onTapGesture {
                                // ao apertar no symbol escolhido
                                selectSymbol(symbol)
                            }
                            .padding(.bottom, 5)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.base)
    }

    // MARK: LÓGICA
    /// Função chamada quando um símbolo é selecionado
    private func selectSymbol (_ symbol : String) {
        emojiPicked = symbol
        dismiss()
    }
}

#Preview {
    @State var emoji = ""
    return EmojiPickerView(emojiPicked: $emoji)
}
