//
//  WorkoutController.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

// Classe responsável por gerar uma sessão de workout e resgatar dados do healthyKit
import Foundation
import HealthKit

@Observable
class WorkoutController: NSObject  {
    //MARK: - Main Variables
    
    //Variáveis responsáveis por receber os dados do workout
    var heartRate: Double = 0
    var averageHeartRate: Double = 0
    var minHeartRate: Double = 0
    var maxHeartRate: Double = 0
    var startTrainning: Date = Date()
    var endTrainning: Date = Date()
    var workout: HKWorkout?
    var time: String = ""
    
    
    var working:Bool = false
    
    //Workout type
    let workoutType: HKWorkoutActivityType = .preparationAndRecovery
    
    //health storage
    let healthStore = HKHealthStore()
    
    //Workout session and session builder
    var session: HKWorkoutSession?
    var builder: HKLiveWorkoutBuilder?
    
    
    //MARK: - Main functions
    ///Pedi autorização para o usuário
    func requestAuthorization() {
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]
        
        let typesToRead: Set = [
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.activitySummaryType(),
        ]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { success, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    ///Inicia o workout e permite que o mesmo funcione em background
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
        
        builder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore, workoutConfiguration: configuration)
        
        let startDate = Date()
        session?.startActivity(with: startDate)
        builder?.beginCollection(withStart: startDate, completion: { (success,error) in
            if let error = error{
                print(error.localizedDescription)
            }
        })
        startTrainning = Date()
    }
    
    //MARK: - Metrics
    
    ///atualiza as métricas do workout
    func updateMetrics(_ statistics: HKStatistics?){
        guard let statistics = statistics else { return }
        
        DispatchQueue.main.async {
            switch statistics.quantityType{
            case HKQuantityType.quantityType(forIdentifier: .heartRate):
                let heartRateUnit = HKUnit.count().unitDivided(by: HKUnit.minute())
                
                self.heartRate = statistics.mostRecentQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                
                self.averageHeartRate = statistics.averageQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                
                self.minHeartRate = statistics.minimumQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                
                self.maxHeartRate = statistics.maximumQuantity()?.doubleValue(for: heartRateUnit) ?? 0
                
            default:
                return
            }
        }
    }
    
    ///Reinicia o workout
    func reset(){
        builder = nil
        session = nil
        heartRate = 0
        averageHeartRate = 0
        minHeartRate = 0
        maxHeartRate = 0
        startTrainning = Date()
        endTrainning = Date()
        time = ""
    }
    
    //MARK: - Session state control
    
    ///funções responsáveis por controlar os estados do workout
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
        self.time = self.builder?.elapsedTime(at: Date()).description ?? ""
        endTrainning = session?.endDate ?? Date()
    }
}

//MARK: - Controller Extensions
//Delgates da session e do builder
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
