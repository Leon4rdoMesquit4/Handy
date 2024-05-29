//
//  HomeView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

//Change the name of this enum later once we know mascot name
/// Esse enum vai servir para guardar as views aleatórias do mascote que vão ser mostradas na HomeView
enum RandomHomeView {
    case view1
}

struct HomeView: View {
    
    @Environment(Coordinator.self) var coordinator
    @Environment(SwiftDataController.self) var controller
    @Environment(\.modelContext) var context
    let randomView: [RandomHomeView] = []
    
    var body: some View {
        VStack {
            selectRandomHomeView(randomView.randomElement() ?? .view1)
                .onTapGesture {
//                    coordinator.navigate(to: .countdownView)
//                    controller.saveALotOfNewExercise(context: context)
                    controller.saveOneExercise(context: context)
                }
            Button("CLIQUE AQUI") {
                controller.removeAll(context: context)
            }
            navigateToGraphButton
        }.ignoresSafeArea()
    }
}

//implementação temporária
///Função que retorna uma view aleatória para ser mostrada na HomeView
@ViewBuilder
func selectRandomHomeView (_ view : RandomHomeView) -> some View {
    switch view {
    default:
        Image(systemName: "plus.square.fill")
    }
}

//Botão que navega para a SelectGraphView
extension HomeView {
    var navigateToGraphButton: some View {
        VStack {
            HStack {
                Image(systemName: "chart.bar.xaxis")
                    .padding(15)
                    .onTapGesture {
                        coordinator.navigate(to: .selectGraphView)
                    }
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    HomeView()
        .environment(Coordinator())
        .environment(SwiftDataController())
}
