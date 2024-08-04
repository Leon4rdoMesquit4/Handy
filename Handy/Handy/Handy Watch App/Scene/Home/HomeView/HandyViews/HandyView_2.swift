//
//  HandyView_2.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 05/06/24.
//

import SwiftUI

//
//  HandyView_1.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 04/06/24.
//

import SwiftUI

struct HandyView_2: View {
    
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BigSpeechBubbleView(vm: BigSpeechBubbleViewModel(orientation: .right))
                    .frame(maxWidth: geometry.size.width * 0.7, maxHeight: geometry.size.height * 0.7)
                    .position(x: geometry.size.width * 0.58, y: geometry.size.height * 0.20)
                VStack {
                    HStack {
                        Spacer()
                        Image("SmallSpeechBubbleButton")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.33)
                            .padding(.top, geometry.size.height * 0.57)
                            .onTapGesture {
                                coordinator.navigate(to: .countdownView)
                            }
                        Spacer(minLength: geometry.size.width * 0.65)
                    }
                    Spacer()
                }.ignoresSafeArea(.all)
                Image("Handy_2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.65, height: geometry.size.width * 0.75)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.7)
            }
        }
    }
}

#Preview {
    HandyView_2()
        .environment(Coordinator())
        .environment(SwiftDataController())
}

