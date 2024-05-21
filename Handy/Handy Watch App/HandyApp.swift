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
            NavigationStack(path: $coordinator.navPath){
                Onboarding()
                    .navigationDestination(for: Coordinator.Destination.self) { destination in
                        switch destination {
                        case .homeView:
                            HomeView()
                        case .countdownView:
                            CountdownView()
                        case .graphView:
                            GraphScrollView()
                        case .selectGraphView:
                            SelectGraphView()
                        case .goalView:
                            GoalView()
                        case .exerciseScrollView:
                            ExercisesScrollView()
                        }
                    }
            }.environment(coordinator)
                
            
        }
    }
}
