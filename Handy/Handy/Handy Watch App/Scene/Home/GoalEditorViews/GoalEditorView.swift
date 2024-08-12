//
//  GoalEditorView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 04/06/24.
//

import SwiftUI
import WatchKit

/// GoalEditorView é uma View que é responsável por exibir o símbolo atual que representa o objetivo do usuário e dá a ele a possibilidade de trocar esse símbolo por outro, possui um botão que vai redirecionar ele para a tela de editar as datas relacionadas com esse mesmo objetivo.
/// Não recebe nenhum parâmetro, pois os dados que ele vai trabalhar já estão contidos dentro do User Defaults.
struct GoalEditorView: View {
    @Environment(Coordinator.self) var coordinator
    
    /// emoji é uma variável temporária que vai, duranto o onAppear da View, receber o mesmo valor que está dentro do User Defaults do usuário e vai ser usada para receber o valor temporário que o usuário vai escolher na tela de EmojiPickerView
    @State var emoji : String = ""
    
    /// emojiAppStorage é uma variável que representa o emoji salvo dentro do User Defaults do usuário.
    @AppStorage ("emoji") var emojiAppStorage : String = ""

    var body: some View {
        VStack {
            Spacer()
            
            goalImage
            
            Spacer()
            
            ButtonNextPage {
                // a ação do botão é salvar o emoji dentro do User Defaults e ir para a próxima tela (tela de trocar as datas estabelecidas.
                saveEmoji()
                coordinator.navigate(to: .goalDateEditorView)
            }
            Spacer()
        }
        .navigationTitle{
            Text("Editar meta")
                .font(.alata(.regular, size: 18, relativeTo: .title3))
                .foregroundStyle(.baseColor2)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchEmojiFromAppStorage()
        }
        .frame(maxWidth: .infinity)
        .background(Color.base)
    }
    
    // MARK: COMPONENTES DE UI
    
    var goalImage : some View {
        Image(systemName: emoji)
            .resizable()
            .scaledToFit()
            .bold()
            .frame(width: WKInterfaceDevice.current().screenBounds.width / 4)
            .onTapGesture {
                coordinator.navigate(to: .EmojiPickerView($emoji))
            }
    }
    
    // MARK: LÓGICA
    func saveEmoji () {
        self.emojiAppStorage = emoji
    }
    
    func fetchEmojiFromAppStorage () {
        // fiz essa verificação porque quando o usuário volta da tela do emoji, essa variável seria carregada de novo e não ia adiantar de nada a escolha do usuário na EmojiPickerView
        if emoji.isEmpty {
            emoji = emojiAppStorage
        }
    }
}

#Preview {
    NavigationStack {
        GoalEditorView()
    }
}
