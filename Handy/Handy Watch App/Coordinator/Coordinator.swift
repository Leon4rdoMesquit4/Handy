//
//  Coordinator.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation
import SwiftUI

@Observable
final class Coordinator{
    
    public enum Destination: Codable, Hashable {
        case countdownView
        case graphView
        case selectGraphView
        case exerciseTabView
        case borgScaleView
        case didFeelPainView
        case painScaleView
        case exerciseUserFeedbackView
    }
    
    var navPath: [Destination] = []
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
}

@Observable
final class OnboardingCoordinator{
    
    public enum Destination: Codable, Hashable {
        case emojiSelectionView
        case treatmentTimeView
        case treatmentTimeBeginningView
        case treatmentTimeEndView
    }
    
    var navPath: [Destination] = []
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
}
