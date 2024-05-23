//
//  ExerciseTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI
import WatchKit

struct ExerciseTabView: View {
    
    @State var selection:TabItems = .stats
    
    enum TabItems {
        case control, stats, media
    }
    
    var body: some View {
        TabView(selection: $selection){
            ExerciseControlView().tag(TabItems.control)
            
            ExerciseStatsView().tag(TabItems.stats)
            
        
        }
        
    }
}

#Preview {
    ExerciseTabView()
}
