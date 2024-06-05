//
//  ExerciseTabView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI
import WatchKit

struct ExerciseTabView: View {
    
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State var selection: TabItems = .stats
    
    enum TabItems {
        case control, stats, media
    }
    
    var body: some View {
        TabView(selection: $selection){
            ExerciseControlView().tag(TabItems.control)
            
            ExerciseStatsView().tag(TabItems.stats)
            
            NowPlayingView().background(Color.base).tint(Color.brandColor2).tag(TabItems.media)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .tabViewStyle(.carousel)
        .onChange(of: isLuminanceReduced) { _,_ in
            selection = .stats
        }
        
    }
}

#Preview {
    ExerciseTabView()
}
