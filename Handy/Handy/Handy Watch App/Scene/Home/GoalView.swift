//
//  GoalView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct GoalView: View {
    @StateObject var vm = GoalViewModel()
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        VStack {
            title.padding(5)
            goalGraph
            Spacer()
        }.background(Color.base)
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        pencilButton
                    }
                }
            }
        }
        .onAppear(perform: {
            vm.configTreatmentDate()
        })
    }
    
    var title : some View {
        HStack {
            Text("Minha meta")
                .padding()
                .font(.title3)
                .bold()
                .font(.alata(.regular, size: 18, relativeTo: .title3))
                .foregroundStyle(.baseColor2)
            
            Spacer()
        }
    }
    
    
}

// MARK: GoalProgress
// mostra a progresso do tratamento da pessoa em percentual e emoji
extension GoalView {
    var goalProgress: some View {
        VStack {
            Image(systemName: vm.emoji)
                .font(.title2)
                .padding(.vertical)
            HStack {
                // TODO: TROCAR ESSA CARINHA
                Image("intensity\(vm.calculateProgressFace())")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)

                Text("\(Int(vm.calculateProgressTreatment()))%")
            }
        }
    }
}


// MARK: GoalGraph
// mostra o gráfico do progresso
extension GoalView {
    var goalGraph: some View {
        ZStack {
            let lineWidth : CGFloat = vm.getWatchWidth() / 12
            
            Circle()
                .stroke(
                    Color.brand.opacity(0.2),
                    lineWidth: lineWidth
                )
                .frame(width: vm.getWatchWidth() / 1.4)
            Circle()
                .trim(from: 0, to: vm.calculateProgressTreatment()/100)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                        
                )
                .rotationEffect(.degrees(-90))
                .frame(width: vm.getWatchWidth() / 1.4)
                .foregroundStyle(LinearGradient(colors: [.brand.opacity(0.3), .brand], startPoint: .bottomLeading, endPoint: .topTrailing))
            
        }
        .overlay(alignment: .center) {
            goalProgress
        }
    }
}

// MARK: PENCIL BUTTON
/// Extensão para montar o botão de editar o objetivo.
extension GoalView {
    var pencilButton : some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.base)
                    .padding()
                    .background(
                        Color.brand
                            .clipShape(Circle())
                    )
                    .onTapGesture {
                        coordinator.navigate(to: .goalEditorView)
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        GoalView()
    }
}

