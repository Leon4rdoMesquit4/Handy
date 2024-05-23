//
//  EmojiPickerView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 23/05/24.
//

import SwiftUI

struct EmojiPickerView: View {
    @Binding var emojiPicked : String
    @Environment (\.dismiss) var dismiss
    
    var columns : [GridItem] = [
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
        GridItem(.fixed(30)),
    ]
    
    var body: some View {
        VStack (spacing: 20){
            Text("Escolha um emoji \(emojiPicked)")
            
            LazyVGrid(columns: columns, content: {
                ForEach(physiotherapyGoalsEmojis, id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            emojiPicked = emoji
                            dismiss()
                        }
                }
            })
            
            
        }
    }
}

#Preview {
    @State var emoji = ""
    return EmojiPickerView(emojiPicked: $emoji)
}
