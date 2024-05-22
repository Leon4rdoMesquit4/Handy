//
//  ControlButton.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct ControlButton: View {
    
    var color: Color
    var action: () -> Void
    var name: String?
    var image:Image
    
    var body: some View {
        VStack{
            Button{
                action()
            }label: {
                image
            }
            .tint(color)
            .font(.title2)
            if let name = name{
                Text(name)
            }
        }
    }
}

#Preview {
    ControlButton(color: .red, action: {print("teste")}, name: "End",image: Image(systemName: "xmark"))
}
