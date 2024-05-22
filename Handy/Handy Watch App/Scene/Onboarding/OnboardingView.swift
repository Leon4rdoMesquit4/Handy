//
//  Onboarding.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct Onboarding: View {
    
    @Binding var isOnboardingComplete: Bool
    
    var body: some View {
        ZStack{
            
            Text("OnboardingView")
                .onTapGesture {
                    isOnboardingComplete = true
                }
                
        }
    }
}

#Preview {
    Onboarding(isOnboardingComplete: Binding.constant(false))
}
