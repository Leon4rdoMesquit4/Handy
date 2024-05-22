//
//  PainScaleView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct PainScaleView: View {
    @State var painIntensity : Int = 0
    @Environment(ExerciseCoordinator.self) var coordinator
    @Binding var isExercising: Bool
    
    var body: some View {
        VStack{
            TitleForm(text: "Qual a intensidade da dor?")
            Spacer()
            StepperImage(value: $painIntensity, interval: 1 ... 10, prefixImage: "pain")
            Spacer()
            
            Button {
                isExercising = false
                coordinator.navigateToRoot()
            } label: {
                Image(systemName: "checkmark")
            }
            
//            ButtonNextPage()   
        }
    }
}

#Preview {
    PainScaleView(isExercising: .constant(true))
}
