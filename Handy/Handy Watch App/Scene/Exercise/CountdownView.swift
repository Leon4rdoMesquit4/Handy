//
//  CountdownView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct CountdownView: View {
    
    @Environment(HomeCoordinator.self) var coordinator

    @Binding var isExercising: Bool
    
    var body: some View {
        VStack{
            Text("CountdownView")
                .onTapGesture {
                    withAnimation {
                        coordinator.navigateToRoot()
                        isExercising = true

                    }
                }
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CountdownView(isExercising: .constant(true))
        
}
