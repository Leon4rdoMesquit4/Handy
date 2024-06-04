//
//  SelectGraphView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI

struct SelectGraphView: View {
    @Environment(Coordinator.self) var coordinator
    
    var body: some View {
        
        Text("Week")
            .onTapGesture {
                coordinator.navigate(to: .graphView)
            }
        
        Text("Month")
            .onTapGesture {
                coordinator.navigate(to: .graphView)
            }
    }
}

#Preview {
    SelectGraphView()
        .environment(Coordinator())
}
