//
//  HomeView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

/// Esse enum vai servir para guardar as views aleatórias do mascote que vão ser mostradas na HomeView
enum RandomHomeView {
    case view1
    case view2
    case view3
}

struct HomeView: View {
    
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    let randomView: [RandomHomeView] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                selectRandomHomeView([.view1, .view2, .view3])
                VStack {
                    navigateToGraphButton
                        .padding(.top, geometry.size.height * 0.1)
                        .padding(.leading, geometry.size.width * 0.1)
                    Spacer()
                }.ignoresSafeArea(.all)
            }
        }
    }
}

extension HomeView {
    //implementação temporária
    ///Função que retorna uma view aleatória para ser mostrada na HomeView
    @ViewBuilder
    func selectRandomHomeView (_ views : [RandomHomeView]) -> some View {
        let view = views.randomElement()
        switch view {
        case .view1:
            HandyView_1()
        case .view2:
            HandyView_2()
        case .view3:
            HandyView_3()
        default:
            Image(systemName: "plus.square.fill")
        }
    }
}

//Botão que navega para a SelectGraphView
extension HomeView {
    var navigateToGraphButton: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(systemName: "chart.bar.xaxis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.07)
                        .foregroundStyle(.base)
                        .padding()
                        .background (
                            Color("BrandColor2")
                                .clipShape(Circle())
                        )
                        .onTapGesture {
                            coordinator.navigate(to: .graphView)
                        }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
