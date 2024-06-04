//
//  GoalEditorView.swift
//  Handy Watch App
//
//  Created by Caio Marques on 04/06/24.
//

import SwiftUI
import WatchKit

struct GoalEditorView: View {
    @Environment(Coordinator.self) var coordinator
    @State var emoji : String = ""
    @AppStorage ("emoji") var emojiAppStorage : String = ""

    func saveEmoji () {
        self.emojiAppStorage = emoji
    }


    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: emoji)
                .resizable()
                .scaledToFit()
                .bold()
                .frame(width:         WKInterfaceDevice.current().screenBounds.width / 4)
                .onTapGesture {
                    coordinator.navigate(to: .EmojiPickerView($emoji))
                }
            Spacer()
            
            ButtonNextPage {
                saveEmoji()
                coordinator.navigate(to: .goalDateEditorView)
            }
            Spacer()
        }
        .navigationTitle("Editar meta")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if emoji.isEmpty {
                emoji = emojiAppStorage
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.base)
    }
}

#Preview {
    NavigationStack {
        GoalEditorView()
    }
}
