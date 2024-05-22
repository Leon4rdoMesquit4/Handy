//
//  EmojiSelectionView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

struct EmojiSelectionView: View {
    @State var emoji : String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 30){
            Text("Qual a sua meta?")
                .font(.title3)
                .bold()
            
            TextField("", text: $emoji)
            
            HStack {
                Spacer()
                ButtonNextPage()
                Spacer()
            }
        }
    }
}

#Preview {
    EmojiSelectionView()
}
