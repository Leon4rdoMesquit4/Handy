//
//  BigSpeechBubbleView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 03/06/24.
//

import SwiftUI

struct BigSpeechBubbleView: View {
    
    var body: some View {
            Image("BigSpeechBubble")
                .resizable()
                .overlay(alignment: .topLeading) {
                    Text("")
                        .padding(15)
                }
    }
}

#Preview {
    BigSpeechBubbleView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
