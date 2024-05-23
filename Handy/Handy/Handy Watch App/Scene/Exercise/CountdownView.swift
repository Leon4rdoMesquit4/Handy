//
//  CountdownView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct CountdownView: View {
    @Environment(Coordinator.self) var coordinator
    @State var counter : Double = 3
    
    var body: some View {
        VStack {
            CircularProgressBar(contagem: $counter, contagemMaxima: 3)
                .overlay(alignment: .center) {
                    Text(Int(counter).description)
                        .font(.title)
                        .bold()
                }
        }
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                
                if self.counter <= 0 {
                    timer.invalidate()
                    coordinator.navigate(to: .exerciseTabView)
                } else {
                    self.counter -= 1
                }
                
            }
        })
    }
}

#Preview {
    CountdownView()
}
