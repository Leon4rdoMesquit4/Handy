//
//  HandyView_1.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 04/06/24.
//

import SwiftUI

struct HandyView_1: View {
    
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        ZStack {
            BigSpeechBubbleView(vm: BigSpeechBubbleViewModel(orientation: .right))
                .frame(maxWidth: 90, maxHeight: 120)
                .position(x: 50, y: 60)
            VStack {
                HStack {
                    Spacer()
                    Image("SmallSpeechBubbleButton")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 45)
                        .padding(.top, 30)
                        .padding(.trailing, 25)
                        .onTapGesture {
                            coordinator.navigate(to: .countdownView)
                        }
                }
                Spacer()
            }.ignoresSafeArea(.all)
            Image("Handy_1")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
                .position(x: 110, y: 95)
        }
    }
}

#Preview {
    HandyView_1()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
