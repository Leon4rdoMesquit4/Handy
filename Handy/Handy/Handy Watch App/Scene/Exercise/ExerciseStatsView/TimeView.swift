//
//  TimeVIew.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct TimeView: View {
    var timePassed: TimeInterval = 0
    var body: some View {
            Text("00:00.01")
                .fontWeight(.semibold)
    }
}

#Preview {
    TimeView()
}
