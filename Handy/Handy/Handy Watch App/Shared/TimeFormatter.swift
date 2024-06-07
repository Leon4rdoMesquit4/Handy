//
//  TimeFormatter.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 29/05/24.
//

import Foundation

//Formata a hora atual para mostrar o tempo passado desde o ínicio do workout 
class TimeFormatter: Formatter {
    let componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    var showSubseconds = true
    
    override func string(for value: Any?) -> String? {
        guard let time = value as? TimeInterval else {
            return nil
        }
        
        guard let formattedString = componentsFormatter.string(from: time) else {
            return nil
        }
        
        let hundredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        return String(format: "%@%@%0.2d", formattedString, decimalSeparator, hundredths)
        
    }
}
