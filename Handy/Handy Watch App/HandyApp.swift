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
    @State var homeCoordinator = HomeCoordinator()
    @State var exerciseCoordinator = ExerciseCoordinator()
    @State var isExercising: Bool = false
    
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
                if !isExercising {
                    NavigationStack(path: $homeCoordinator.navPath){
                        HomeTabView()
                            .navigationDestination(for: HomeCoordinator.Destination.self) { destination in
                                switch destination {
                                case .countdownView:
                                    CountdownView(isExercising: $isExercising)
                                case .graphView:
                                    GraphScrollView()
                                case .selectGraphView:
                                    SelectGraphView()
                                }
                            }
                    }.environment(homeCoordinator)
                }
                else {
                    NavigationStack(path: $exerciseCoordinator.navPath){
                        ExerciseTabView(isExercising: $isExercising)
                            .navigationDestination(for: ExerciseCoordinator.Destination.self) { destination in
                                switch destination {
                                case .borgScaleView:
                                    BorgScaleView()
                                case .didFeelPainView:
                                    DidFeelPainView(isExercising: $isExercising)
                                case .painScaleView:
                                    PainScaleView(isExercising: $isExercising)
                                case .exerciseUserFeedbackView:
                                    ExerciseUserFeedbackView()
                                }
                            }
                            
                    }.environment(exerciseCoordinator)
                }
            }
        }
    }
}
