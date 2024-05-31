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
    
    @State var controller = WorkoutController()
    @State var mainCoordinator: Coordinator = Coordinator()
    @State var onboardingCoordinator: OnboardingCoordinator = OnboardingCoordinator()
    @State var swiftDataController = SwiftDataController()
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
                                    .navigationBarBackButtonHidden()
                            case .treatmentTimeView:
                                TreatmentTimeView_(isOnboardingComplete: $isOnboardingComplete)
                                    .navigationBarBackButtonHidden()
                            case .treatmentTimeBeginningView(let binding):
                                TreatmentTimeBeginningView(dataInicio: binding)
                            case .treatmentTimeEndView(let binding):
                                TreatmentTimeEndView(dataFinal: binding)
                            case .EmojiPickerView(let binding):
                                EmojiPickerView(emojiPicked: binding)
                            }
                        }
                }
                .environment(onboardingCoordinator)
                
            } else {
                NavigationStack(path: $mainCoordinator.navPath){
                    HomeTabView()
                        .navigationDestination(for: Coordinator.Destination.self) { destination in
                            switch destination {
                            case .countdownView:
                                CountdownView()
                                    .navigationBarBackButtonHidden()
                            case .graphView(let graphCase):
                                GraphsTabView(graphCase: graphCase)
                            case .selectGraphView:
                                SelectGraphView()
                            case .exerciseTabView:
                                ExerciseTabView()
                                    .navigationBarBackButtonHidden()
                            case .borgScaleView:
                                BorgScaleView()
                                    .navigationBarBackButtonHidden()
                            case .didFeelPainView:
                                DidFeelPainView()
                                    .navigationBarBackButtonHidden()
                            case .painScaleView:
                                PainScaleView()
                                    .navigationBarBackButtonHidden()
                            case .exerciseUserFeedbackView:
                                ExerciseUserFeedbackView()
                                    .navigationBarBackButtonHidden()
                            case .exerciseDetailView(let exercise):
                                ExerciseDetailView(exercise: exercise)
                            }
                        }
                }
                .onAppear(perform: {
                    controller.requestAuthorization()               
                })
                .environment(controller)
                .environment(mainCoordinator)
                .environment(swiftDataController)
                
            }
            
        }.modelContainer(container)
    }
    
}

