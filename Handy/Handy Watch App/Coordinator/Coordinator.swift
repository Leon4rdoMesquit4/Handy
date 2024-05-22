//
//  Coordinator.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation


@Observable
final class HomeCoordinator{
    
    public enum Destination: Codable, Hashable {
        case countdownView
        case graphView
        case selectGraphView
    }
    
    public enum navpth{
        case n1
        case n2
    }
    
    var navPath: [Destination] = []
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateToRoot() {
        navPath = []
    }
    
}

@Observable
final class ExerciseCoordinator{
    
    public enum Destination: Codable, Hashable {
        case borgScaleView
        case didFeelPainView
        case painScaleView
        case exerciseUserFeedbackView
    }

    var navPath: [Destination] = []

    func navigate( to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateToRoot() {
        navPath = []
    }
    
}
