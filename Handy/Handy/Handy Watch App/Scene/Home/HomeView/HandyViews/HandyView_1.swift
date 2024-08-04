//
//  HandyView_1.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 04/06/24.
//

import SwiftUI

struct HandyView_1: View {
    
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BigSpeechBubbleView(vm: BigSpeechBubbleViewModel(orientation: .right))
                    .frame(maxWidth: geometry.size.width * 0.65, maxHeight: geometry.size.height * 0.65)
                    .position(x: geometry.size.width * 0.30, y: geometry.size.height * 0.4)
                VStack {
                    HStack {
                        Spacer(minLength: geometry.size.width * 0.50)
                        Image("SmallSpeechBubbleButton")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.33)
                            .padding(.top, geometry.size.height * 0.18)
                            .onTapGesture {
                                coordinator.navigate(to: .countdownView)
                            }
                        Spacer()
                    }
                    Spacer()
                }.ignoresSafeArea(.all)
                Image("Handy_1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.7, height: geometry.size.width * 0.85)
                    .position(x: geometry.size.width * 0.65, y: geometry.size.height * 0.66)
            }
        }
    }
}

#Preview {
    HandyView_1()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
