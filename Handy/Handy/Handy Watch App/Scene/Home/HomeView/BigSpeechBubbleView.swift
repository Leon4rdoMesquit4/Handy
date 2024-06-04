//
//  BigSpeechBubbleView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 03/06/24.
//

import SwiftUI

struct BigSpeechBubbleView: View {
    
    @StateObject var vm = BigSpeechBubbleViewModel()
    
    var body: some View {
            Image("BigSpeechBubble")
                .resizable()
                .overlay(alignment: .topLeading) {
                    Text(vm.selectRandomSpeechBubblePhrase())
                        .padding(15)
                }
    }
}

#Preview {
    BigSpeechBubbleView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
