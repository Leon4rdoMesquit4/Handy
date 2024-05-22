//
//  CountdownView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct CountdownView: View {
    @StateObject var vm = CountdownViewModel()
    
    var body: some View {
        VStack {
            CircularProgressBar(contagem: $vm.counter, contagemMaxima: 3)
                .overlay(alignment: .center) {
                    Text(Int(vm.counter).description)
                        .font(.title)
                        .bold()
                }
        }
        .onAppear(perform: {
            vm.setupTimer()
        })
    }
    
    // TODO: TIRAR ESSA VIEWMODEL DESSE ARQUIVO, EU NÃO CONSEGUI FAZER ISSO FOI MAL :(
    class CountdownViewModel : ObservableObject {
        @Published var counter : Double = 3
        
        func setupTimer() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
                if let self {
                    if self.counter <= 0 {
                        timer.invalidate()
                    } else {
                        self.counter -= 1
                    }
                }
            }
        }
    }
}

#Preview {
    CountdownView()
}
