//
//  EmojiSelectionView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 22/05/24.
//

import SwiftUI

/// View que serve para selecionar o emoji que vai ser usado para descrever a meta do usuário ao usar o nosso aplicativo
struct EmojiSelectionView: View {
    @Environment(OnboardingCoordinator.self) var coordinator
    @StateObject var vm = EmojiSelectionViewModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 30){
            Text("Qual a sua meta?")
                .font(.title3)
                .bold()
            
            HStack {
                Spacer()
                
                ZStack {
                    if vm.emoji.count == 0 {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 40)
                            .foregroundStyle(.gray)
                            .onTapGesture {
                                coordinator.navigate(to: .EmojiPickerView($vm.emoji))
                            }
                    }
                    
                    Text(vm.emoji)
                        .onTapGesture {
                            coordinator.navigate(to: .EmojiPickerView($vm.emoji))
                        }

                }
                Spacer()
            }
                        
            self.botaoNextPage
        }
        .alert(isPresented: $vm.alertInvalidEmojiIsPresented) {
            Alert(title: Text("Ops! Nenhum emoji selecionado"))
        }
    }
    
    // MARK: COMPONENTES DE UI
    var botaoNextPage : some View {
        HStack {
            Spacer()
            
            ButtonNextPage(callback: {
                if vm.validateEmoji() {
                    coordinator.navigate(to: .treatmentTimeView)
                } else {
                    vm.showAlertInvalidEmoji()
                }
            })
            Spacer()
        }
    }
}

#Preview {
    EmojiSelectionView()
        .environment(OnboardingCoordinator())
}
