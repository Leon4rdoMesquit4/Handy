//
//  Coordinator.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation
import SwiftUI

///Responsável pela navegação principal do app
@Observable
final class Coordinator{
    
    ///Destinos possíveis para a navegação
    public enum Destination: Equatable, Hashable {
        
        public static func == (lhs: Coordinator.Destination, rhs: Coordinator.Destination) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            default:
                hasher.combine("\(self)")
            }
        }
        
        
        enum GraphCases{
            case month
            case week
        }
        
        case countdownView
        case graphView(GraphCases)
        case selectGraphView
        case exerciseTabView
        case borgScaleView
        case didFeelPainView
        case painScaleView
        case exerciseUserFeedbackView
        case exerciseDetailView(Exercise)
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

///Responsável pela navegação do Onboarding do app
@Observable
final class OnboardingCoordinator{
    
    public enum Destination: Equatable, Hashable {
        public static func == (lhs: OnboardingCoordinator.Destination, rhs: OnboardingCoordinator.Destination) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            default:
                hasher.combine("\(self)")
            }
        }
        
        case emojiSelectionView
        case treatmentTimeView
        case treatmentTimeBeginningView(Binding<Date>)
        case treatmentTimeEndView(Binding<Date>)
        case EmojiPickerView(Binding<String>)
    }
    
    var navPath: [Destination] = []
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
}
