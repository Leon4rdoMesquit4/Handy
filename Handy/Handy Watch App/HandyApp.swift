//
//  HandyApp.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 17/05/24.
//

import SwiftUI
import SwiftData

@main
struct Handy_Watch_AppApp: App {
    
    @State var mainCoordinator: Coordinator = Coordinator()
    @State var onboardingCoordinator: OnboardingCoordinator = OnboardingCoordinator()
    @AppStorage("onboarding") var isOnboardingComplete: Bool = false
    
    let container : ModelContainer
    
    init() {
        let squema = Schema([Exercise.self])
        let config = ModelConfiguration("Exercise", schema: squema)
        do {
            container = try ModelContainer(for: squema, configurations: config)
        } catch {
            fatalError("Não conseguimos inicializar ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if !isOnboardingComplete{
                NavigationStack(path: $onboardingCoordinator.navPath){
                    Onboarding()
                        .navigationDestination(for: OnboardingCoordinator.Destination.self) { destination in
                            switch destination {
                            case .emojiSelectionView:
                                EmojiSelectionView()
                            case .treatmentTimeView:
                                TreatmentTimeView_()
                            case .treatmentTimeBeginningView:
                                TreatmentTimeBeginningView(dataInicio: .constant(.now))
                            case .treatmentTimeEndView:
                                TreatmentTimeEndView(dataFinal: .constant(.distantFuture))
                            }
                        }
                }
                
            } else {
                NavigationStack(path: $mainCoordinator.navPath){
                    HomeTabView(goal: .init(name: "", emoji: "", progress: 9))
                        .navigationDestination(for: Coordinator.Destination.self) { destination in
                            switch destination {
                            case .countdownView:
                                CountdownView()
                            case .graphView:
                                GraphScrollView()
                            case .selectGraphView:
                                SelectGraphView()
                            case .exerciseTabView:
                                ExerciseTabView()
                            case .borgScaleView:
                                BorgScaleView()
                            case .didFeelPainView:
                                DidFeelPainView()
                            case .painScaleView:
                                PainScaleView()
                            case .exerciseUserFeedbackView:
                                ExerciseUserFeedbackView()
                            }
                        }
                }.environment(mainCoordinator)
                
            }
                
        }.modelContainer(container)
    }
        
}

