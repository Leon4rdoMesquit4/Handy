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
    
    @AppStorage("Onboarding") var isOnboardingComplete: Bool = false
    @State var coordinator = Coordinator()
    
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
                Onboarding(isOnboardingComplete: $isOnboardingComplete)
            } else {
                NavigationStack(path: $coordinator.navPath){
                    HomeTabView()
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
                            case .homeTabView:
                                HomeTabView()
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
                }.environment(coordinator)
            }
        }
    }
}
