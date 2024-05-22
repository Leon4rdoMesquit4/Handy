//
//  DidFeelPainView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct DidFeelPainView: View {
    
    @Environment(ExerciseCoordinator.self) var coordinator
    @Binding var isExercising: Bool
    
    var body: some View {
        VStack{
            
            TitleForm(text: "Sentiu dor ao praticar?")
            Spacer()
            
            HStack (spacing: 30){
                Button {
                    coordinator.navigate(to: .painScaleView)
                } label: {
                    Image(systemName: "xmark")
                }
               
                Button {
                    isExercising = false
                    coordinator.navigateToRoot()
                } label: {
                    Image(systemName: "checkmark")
                }
            }
            
            Spacer()
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Text("3/3")
            }
        })
    }
}

#Preview {
    NavigationStack {
        DidFeelPainView(isExercising: .constant(true))
    }
}
