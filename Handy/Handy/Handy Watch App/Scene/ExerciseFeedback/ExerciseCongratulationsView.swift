//
//  ExerciseCongratulationsView.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 03/08/24.
//

import SwiftUI

struct ExerciseCongratulationsView: View {
    
    @State var size: CGSize = .zero
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        ZStack {
            HStack {
                VStack{
                    Text("Parabéns!")
                        .font(.alata(.regular,size: size.height / 12, relativeTo: .callout))
                        .lineLimit(1)
                        .padding(2)
                    Text("Persistencia é o caminho.")
                        .font(.poppins(.light,size: size.height / 17,  relativeTo: .callout))
                        .multilineTextAlignment(.center)
                    Spacer()
                    ButtonNextPage (callback: {
                        coordinator.navigateToRoot()
                    }, systemImage: "checkmark")
                }
                .padding(.vertical, size.height / 7.5)
                Spacer(minLength: size.width / 2.7)
            }.padding(.leading, 5)
            
            Image("Handy_4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.height / 2.2)
                .offset(x: size.width / 6 , y: size.width / 15)
                .scaleEffect((size.height / size.width) * 0.87)
            
        }.frame(maxWidth: .infinity)
            .background(Color.base)
            .background(
                GeometryReader{ geometry in
                    Color.clear
                        .onAppear{
                            size = geometry.size
                        }
                }
            )
            .ignoresSafeArea()
    }
}

#Preview {
    ExerciseCongratulationsView()
        .environment(Coordinator())
}
