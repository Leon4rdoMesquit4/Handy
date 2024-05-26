//
//  DidFeelPainView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct DidFeelPainView: View {
    @Environment(Coordinator.self) var coordinator
    @Environment(\.modelContext) var context
    @Environment(SwiftDataController.self) var controller
    
    var body: some View {
        VStack{
            
            TitleForm(text: "Sentiu dor ao praticar?")
            Spacer()
            
            HStack (spacing: 30){
                Button {
                    controller.saveNewExercise(context: context)
                    coordinator.navigateToRoot()
                } label: {
                    Image(systemName: "xmark")
                }
                
                Button {
                    coordinator.navigate(to: .painScaleView)
                } label: {
                    Image(systemName: "checkmark")
                }
            }
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("3/3")
            }
        }
    }
}

#Preview {
    NavigationStack {
        DidFeelPainView()
            .environment(Coordinator())
            .environment(SwiftDataController())
    }
}
