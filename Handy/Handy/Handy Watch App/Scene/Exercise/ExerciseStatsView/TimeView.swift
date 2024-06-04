//
//  TimeVIew.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import SwiftUI

struct TimeView: View {
    
    @Environment(WorkoutController.self) var wcontroller
    @Environment(SwiftDataController.self) var controller
    var timePassed: TimeInterval = 0
    var formatter = TimeFormatter()
    
    var body: some View {
        VStack{
            Text(NSNumber(value: timePassed), formatter: formatter)
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .foregroundStyle(Color.brandColor2)
        }
    }
}

#Preview {
    TimeView()
}
