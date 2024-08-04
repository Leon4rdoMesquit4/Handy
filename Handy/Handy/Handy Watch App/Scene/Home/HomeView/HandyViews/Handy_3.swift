//
//  Handy_3.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 05/06/24.
//

import SwiftUI

struct HandyView_3: View {
    
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BigSpeechBubbleView(vm: BigSpeechBubbleViewModel(orientation: .left))
                    .frame(maxWidth: geometry.size.width * 0.7, maxHeight: geometry.size.height * 0.7)
                    .position(x: geometry.size.width * 0.55, y: geometry.size.height * 0.35)
                VStack {
                    HStack {
                        Spacer()
                        Image("SmallSpeechBubbleButton")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.33)
                            .padding(.top, geometry.size.height * 0.53)
                            .onTapGesture {
                                coordinator.navigate(to: .countdownView)
                            }
                        Spacer(minLength: geometry.size.width * 0.75)
                    }
                    Spacer()
                }.ignoresSafeArea(.all)
                Image("Handy_3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.width * 0.75)
                    .position(x: geometry.size.width * 0.85, y: geometry.size.height * 0.7)
            }
        }
    }
}

#Preview {
    HandyView_3()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
