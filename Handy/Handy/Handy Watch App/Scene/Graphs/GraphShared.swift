//
//  Extension.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 28/05/24.
//

import Foundation
import SwiftUI

struct GraphData<T>: Identifiable{
    var id: UUID = UUID()
    var date: Date
    var value: T
}

extension Date {
    static func averageValuesByDay(exercises: [Exercise], keypath: KeyPath<Exercise, Double?>) -> [GraphData<Double>] {
        var groupedItems: [String: (sum: Double, count: Int)] = [:]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        
        for exercise in exercises {
            let dateKey = dateFormatter.string(from: exercise.startTrainning)
            
            if groupedItems[dateKey] == nil {
                groupedItems[dateKey] = (sum: 0, count: 0)
            }
            
            if let bpm = exercise[keyPath: keypath] {
                groupedItems[dateKey]?.sum += bpm
                groupedItems[dateKey]?.count += 1
            }
            
        }
        
        var result = [GraphData<Double>]()
        
        for (dateString, (sum, count)) in groupedItems {
            if let date = dateFormatter.date(from: dateString) {
                let averageValue = sum / Double(count)
                let data = GraphData(date: date, value: averageValue)
                result.append(data)
            }
        }
        
        return result.sorted(by: {$0.date < $1.date})
    }
}
