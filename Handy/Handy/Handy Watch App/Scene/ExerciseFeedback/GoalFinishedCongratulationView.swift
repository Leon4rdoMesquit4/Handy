//
//  GoalFinishedCongratulationView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 04/08/24.
//

import SwiftUI

struct GoalFinishedCongratulationView: View {
    
    @State var size: CGSize = .zero
    @State var canAnimate: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width / 6, height: size.width / 6)
                        .offset(x: -size.width / 13, y: size.height / 14)
                        .foregroundStyle(.brand)
                        .padding(.top, 4)
                        .onTapGesture {
                            withAnimation(.bouncy(duration: 5)) {
                                canAnimate.toggle()
                            }
                            
                        }
                }
                Text("Parabéns")
                    .font(.alata(.regular, size: 18, relativeTo: .subheadline))
                    .padding(.bottom, 3)
                Text("Você praticou muito até aqui e completou sua meta!")
                    .font(.poppins(.light, size: 12, relativeTo: .body))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.horizontal, 15)
                Spacer()
                Image("Handy_5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .zIndex(1)
                    .scaleEffect(1.3)
                    .offset(x: 0, y: size.width / 10)
            }.ignoresSafeArea()
            
                .background(Color.base)
                .background(
                    GeometryReader{ geometry in
                        Color.clear
                            .onAppear{
                                size = geometry.size
                            }
                    }
                )

            Image("Confetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .zIndex(0)
                .scaleEffect(1.2)
                .offset(x: 0, y: canAnimate ? (size.height * 2.3) : (-size.height * 1.7))
            
            Image("Confetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.2)
                .rotationEffect(canAnimate ? .degrees(90) : .degrees(85))
                .offset(x: -100, y: canAnimate ? (size.height * 1.7) : (-size.height * 1.7))
            
            Image("Confetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.2)
                .rotationEffect(canAnimate ? .degrees(-90) : .degrees(-85))
                .offset(x: 100, y: canAnimate ? (size.height * 1.3) : (-size.height * 1.7))
            
            Image("Confetti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.2)
                .rotationEffect(canAnimate ? .degrees(180) : .degrees(185))
                .offset(x: 0, y: canAnimate ? (size.height * 2.5) : (-size.height * 1.7))
        }

    }
}

#Preview {
    GoalFinishedCongratulationView()
}
