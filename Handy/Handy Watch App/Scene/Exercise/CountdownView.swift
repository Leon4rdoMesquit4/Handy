//
//  CountdownView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct CountdownView: View {
    
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        VStack{
            Text("CountdownView")
                .onTapGesture {
                    coordinator.navigate(to:.exerciseTabView )
                }
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CountdownView()
        .environment(Coordinator())
}
