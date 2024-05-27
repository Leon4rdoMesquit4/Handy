//
//  TimeFormatter.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 24/05/24.
//

import Foundation

class TimeFormatter: Formatter {
    let componentsFormatter: DateComponentsFormatter = {
       let components = DateComponentsFormatter()
        components.allowedUnits = [.minute,.second]
        components.zeroFormattingBehavior = .pad
        return components
    }()
    
    override func string(for obj: Any?) -> String? {
        guard let time = obj as? TimeInterval else {
            return nil
        }
        
        guard let formattedString = componentsFormatter.string(from: time) else { return nil }
        
        let hundreths = Int((time.truncatingRemainder(dividingBy: 1))*100)
        let decimalSeparator = Locale.current.decimalSeparator ?? "."
        return String(format: "%@%@%0.2d", formattedString,decimalSeparator,hundreths)
    }
}
