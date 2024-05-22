//
//  ControlView.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct ControlView: View {
    var body: some View {
        HStack{
            ControlButton(color: .gray, action: {print("teste")}, name: "end", image: Image(systemName: "xmark"))
            ControlButton(color: .gray, action: {print("pausou")}, name: "Pausar", image: Image(systemName: "pause.fill"))
        }
    }
}

#Preview {
    ControlView()
}
