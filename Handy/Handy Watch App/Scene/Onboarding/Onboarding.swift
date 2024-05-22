//
//  Onboarding.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            title
                .font(.title3)
                .frame(height: 0)
            
            Spacer()
            descriptionPage
                .font(.system(size: 12))
            Spacer()
            HStack {
                Spacer()
                
                ButtonNextPage()
                    .frame(height: 1)
                Spacer()
            }
            
        }
    }
    
    var title : some View {
        Text("Estabeleça a sua meta")
    }
    
    var descriptionPage : some View {
        Text("Hoje começa sua recuperação! Com um objetivo em mente, fica mais fácil seguir.\n\nEstaremos com você durante todo o processo.")
    }
}

#Preview {
    Onboarding()
}
