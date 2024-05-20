//
//  DidFeelPainView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct DidFeelPainView: View {
    var body: some View {
        VStack{
            Text("Sentiu dor ao praticar?")
                .multilineTextAlignment(.center)
                .bold()
            
            Spacer()
            
            HStack (spacing: 30){
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                }
                
                Button {
                    
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
        DidFeelPainView()
    }
}
