//
//  EmojiPickerView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 23/05/24.
//

import SwiftUI

struct SymbolPickerView: View {
    @Binding var symbolPicked : String
    @Environment (\.dismiss) var dismiss
    
    let physiotherapySymbolList: [String] = [
        "figure.indoor.cycle",
        "figure.volleyball",
        "figure.walk",
        "figure.archery",
        "figure.fencing",
        "camera",
        "gamecontroller",
        "car",
        "comb",
        "guitars",
        "shower.handheld",
        "hammer",
        "paintbrush",
        "die.face.6.fill",
        "pianokeys",
        "cart",
        "music.mic",
        "dumbbell.fill",
        "book",
        "pencil.and.list.clipboard",
        "bed.double",
        "shoe",
        "frying.pan",
        "shower.handheld.fill"
        
        
        
        //"✍️", "👨‍💻", "🧑‍🔧", "👩‍💻", "👩‍🌾", "👩‍🍳", "💅", "🧶", "🪡",
        //"👟", "🧳", "🎓", "🤽‍♀️", "🤽", "🏌️", "🏌️‍♀️", "🤺", "⛹️‍♂️",
        //"⛹️‍♀️", "🤼", "🪂", "🏋️‍♀️", "⛷️", "🎨", "🤹‍♀️", "🎮", "🚗",
       //"🛵", "⛺️", "🛠️", "💵", "🛍️", "🍽️", "🎨", "🎸", "🫦", "🧗‍♂️", "🛏️"
    ]
    
    var columns : [GridItem] = [
        GridItem(.fixed(32)),
        GridItem(.fixed(32)),
        GridItem(.fixed(32)),
        GridItem(.fixed(32)),
        GridItem(.fixed(32)),
    ]
    
    var body: some View {
        VStack (spacing: 20){
            
            HStack {
                Text("Escolha um símbolo")
                Image(systemName: symbolPicked)
            }
            
            LazyVGrid(columns: columns, content: {
                ForEach(physiotherapySymbolList, id: \.self) { emoji in
                    Image(systemName: emoji)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .onTapGesture {
                            symbolPicked = emoji
                            dismiss()
                        }
                }
            })
        }
    }
}

#Preview {
    @State var emoji = ""
    return SymbolPickerView(symbolPicked: $emoji)
}
