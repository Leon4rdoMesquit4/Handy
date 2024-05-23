//
//  BorgScaleView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct BorgScaleView: View {
    @State var borgScale : Int = 1
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        VStack (spacing: 5){
            
            TitleForm(text: "Qual foi a dificuldade do exercício?")
            Spacer()
            stepperBorgScale
            Spacer()
            ButtonNextPage{
                coordinator.navigate(to: .didFeelPainView)
            }
        }
        .navigationTitle("1/3")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: MODULARIZAÇÃO DAS VIEWS
    
    var stepperBorgScale : some View {
        Stepper(value: $borgScale, in: 1 ... 10, label: {
            Text(borgScale.description)
                .frame(width: 75, height: 75)
                .background(Color.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    NavigationStack {
        BorgScaleView()
    }
}
