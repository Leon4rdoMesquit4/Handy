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
    
    // MARK: BODY
    var body: some View {
        ZStack{
            
            Color.base
            
            VStack (alignment: .leading, spacing: 10){
                
                title
                
                selectedSymbol
                    .padding(.vertical, 10)
                
                if vm.isEmojiSelected() {
                    self.botaoNextPage
                } else {
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .padding()
            .alert(isPresented: $vm.alertInvalidEmojiIsPresented) {
                Alert(title: Text("Ops! Nenhum emoji selecionado"))
            }
            .background(Color.base)
        }.background(Color.base)
    }
    
    // MARK: COMPONENTES DE UI
    
    /// Título da página
    var title : some View {
        Text("Qual a sua meta?")
            .font(.title3)
            .foregroundStyle(.brand)
            .bold()
    }
    
    /// Symbol selecionado pelo usuário, se não houver nenhum symbol selecionado, então aparece simplesmente o plus.circle.fill
    var selectedSymbol : some View {
        HStack {
            Spacer()
            Image(systemName: vm.isEmojiSelected() ? vm.emoji : "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundStyle(.brandColor2)
                .onTapGesture {
                    coordinator.navigate(to: .EmojiPickerView($vm.emoji))
                }
            
            Spacer()
        }
    }
    
    /// Botão que vai redirecionar o usuário para a próxima página da Onboarding
    var botaoNextPage : some View {
        HStack {
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .bold()
                .frame(width: 10)
                .foregroundStyle(Color.base)
                .frame(alignment: .center)
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
                .background(Color.brand)
                .clipShape(Capsule())
                .onTapGesture {
                    buttonNextPagePressed()
                }
            Spacer()
        }
    }
    
    // MARK: LÓGICA
    
    /// Função chamada quando o botão de ir para a próxima tela é chamado
    private func buttonNextPagePressed () {
        if vm.validateEmoji() {
            vm.saveEmoji()
            coordinator.navigate(to: .treatmentTimeView)
        } else {
            vm.showAlertInvalidEmoji()
        }
    }
}

#Preview {
    EmojiSelectionView()
        .environment(OnboardingCoordinator())
}
