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
        //MARK: - Funções para permitir que o app receba um binding
        public static func == (lhs: Coordinator.Destination, rhs: Coordinator.Destination) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            default:
                hasher.combine("\(self)")
            }
        }
        
        //MARK: - Funções para a troca de telas do fluxo principal do aplicativo
        case countdownView
        case graphView
        case selectGraphView
        case exerciseTabView
        //case borgScaleView
        case didFeelPainView
        case painScaleView
        case exerciseUserFeedbackView
        case exerciseDetailView(Exercise)
        case goalEditorView
        case goalDateEditorView
        case EmojiPickerView(Binding<String>)
        case GoalEditorDatePickerView(String, Binding<Date>)
    }
    
    //No path será armazenado todas as direções do aplicativo
    var navPath: [Destination] = []
    
    //Serve como um navigation link para todo o sistema de navegação do app
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    //Volta uma view na hierarquia de navegação do aplicativo
    func navigateBack() {
        navPath.removeLast()
    }
    
    //Volta para a primeira view da hierarquia
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
}

///Responsável pela navegação do Onboarding do app
@Observable
final class OnboardingCoordinator{
    
    public enum Destination: Equatable, Hashable {
        //Funções para permitir que o app receba um binding
        public static func == (lhs: OnboardingCoordinator.Destination, rhs: OnboardingCoordinator.Destination) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            default:
                hasher.combine("\(self)")
            }
        }
        
        //Funções para a troca de telas do fluxo principal do aplicativo:
        case emojiSelectionView
        case treatmentTimeView
        case treatmentTimeBeginningView(Binding<Date>)
        case treatmentTimeEndView(Binding<Date>)
        case EmojiPickerView(Binding<String>)
    }
    
    //No path será armazenado todas as direções do aplicativo
    var navPath: [Destination] = []
    
    //Serve como um navigation link para todo o sistema de navegação do app
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    //Volta uma view na hierarquia de navegação do aplicativo
    func navigateBack() {
        navPath.removeLast()
    }
    
}
