//
//  ExerciseDetailView.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import SwiftUI
import WatchKit

struct ExerciseMainView: View {
    
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selected:Tab = .metrics
    
    enum Tab{
        case metrics,controls,media
    }
    
    var body: some View {
        TabView(selection: $selected) {
            ControlView().tag(Tab.controls)
            ExerciseDetailView().tag(Tab.metrics)
            NowPlayingView().tag(Tab.media)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .tabViewStyle(.carousel)
        .onChange(of: isLuminanceReduced) { _,_ in
            displayDetailView()
        }
        
        
    }
    
    private func displayDetailView() {
        withAnimation {
            selected = .metrics
        }
    }
}

#Preview {
    ExerciseMainView()
}
