//
//  SmallSpeechBubbleButton.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 04/06/24.
//

import SwiftUI

struct SmallSpeechBubbleButton: View {
    var body: some View {
        ZStack {
            Image("SmallSpeechBubbleButton")
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
        }
    }
}

#Preview {
    SmallSpeechBubbleButton()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
