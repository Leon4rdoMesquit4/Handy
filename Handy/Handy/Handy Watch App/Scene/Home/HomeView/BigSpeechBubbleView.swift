//
//  BigSpeechBubbleView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 03/06/24.
//

import SwiftUI

struct BigSpeechBubbleView: View {
    
    @StateObject var vm: BigSpeechBubbleViewModel
    
    var body: some View {
        Image("BigSpeechBubble")
            .resizable()
            .scaledToFit()
            .rotation3DEffect(.degrees(vm.orientation == .left ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .overlay(alignment: vm.orientation == .left ? .topLeading : .topTrailing) {
                GeometryReader { geometry in
                    Text(vm.selectRandomSpeechBubblePhrase())
                        .minimumScaleFactor(0.1)
                        .frame(maxHeight: geometry.size.height * 2/3)
                        .padding(.horizontal)
                }
            }
    }
}

#Preview {
    BigSpeechBubbleView(vm: BigSpeechBubbleViewModel(orientation: .left))
        .environment(Coordinator())
        .environment(SwiftDataController())
}
