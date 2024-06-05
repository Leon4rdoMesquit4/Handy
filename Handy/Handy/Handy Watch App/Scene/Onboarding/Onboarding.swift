//
//  Onboarding.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct Onboarding: View {
    
    @Environment(OnboardingCoordinator.self) var coordinator
    
    var body: some View {
        ZStack{
            
            Color.base
            
            VStack (alignment: .leading, spacing: 10){
                
                ScrollView{
                    descriptionPage
                        .font(.system(size: 12))
                        .padding()
                }
                
                self.buttonNextPage
                    .padding()
            }.navigationTitle("Estabeleça sua meta")
        }.background(Color.base)
    }
    
    // MARK: COMPONENTES DE UI
    var buttonNextPage : some View {
        HStack {
            Spacer()
            
            ButtonNextPage{
                coordinator.navigate(to: .emojiSelectionView)
            }
            .frame(height: 1)
            Spacer()
        }
    }
    
    var descriptionPage : some View {
        Text("Hoje começa sua recuperação! Com um objetivo em mente, fica mais fácil seguir.")
    }
}

#Preview {
    Onboarding()
        .environment(OnboardingCoordinator())
}
