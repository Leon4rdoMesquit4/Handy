//
//  WorkoutController.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation
import HealthKit

public class WorkoutController: NSObject, ObservableObject, Observable  {
    //MARK: - Main Variables
    //Workout type
    let workoutType: HKWorkoutActivityType = .preparationAndRecovery
    
    //health storage
    let healthStore = HKHealthStore()
    
    //Workout session and session builder
    var session: HKWorkoutSession?
    var builder: HKLiveWorkoutBuilder?
    
    
    //MARK: - Main functions
    func requestAuthorization() {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]
        
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.activitySummaryType()
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { success, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func startWorkout(){
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = workoutType
        configuration.locationType = .indoor
        
        do{
            session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            builder = session?.associatedWorkoutBuilder()
        }catch {
            print(error.localizedDescription)
            return
        }
        
        session?.delegate = self
        builder?.delegate = self
    }
    
    
    //MARK: - Session state control
    
    @Published var working:Bool = false
    
    func togglePause(){
        if working == true{
            self.pause()
        }else {
            self.resume()
        }
    }
    
    func pause(){
        session?.pause()
    }
    
    func resume(){
        session?.resume()
    }
    
    func endWorkout(){
        session?.end()
    }
    
    
    //MARK: - Metrics
    @Published var heartRate: Double = 0
    @Published var workout: HKWorkout?
    
    func updateMetrics(_ statics: HKStatistics?){
        guard let statics = statics else { return }
        
        DispatchQueue.main.async {
            switch statics.quantityType{
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                self.heartRate = statics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0
            default:
                return
            }
        }
    }
    
    func reset(){
        builder = nil
        session = nil
        heartRate = 0
    }
}

//MARK: - Controller Extensions
extension WorkoutController: HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        DispatchQueue.main.async {
            self.working = toState == .running
        }
        
        if toState == .ended{
            builder?.endCollection(withEnd: date, completion: { (success, error) in
                self.builder?.finishWorkout(completion: { (workout,error) in
                    DispatchQueue.main.async {
                        self.workout = workout
                    }
                })
            })
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: any Error) {
    
    }
    
    
}

extension WorkoutController: HKLiveWorkoutBuilderDelegate {
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        for type in collectedTypes {
            guard let quantityType = type as? HKQuantityType else { return }
            let statistics = workoutBuilder.statistics(for: quantityType)
            self.updateMetrics(statistics)
        }
    }
    
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        
    }
    
    
}
