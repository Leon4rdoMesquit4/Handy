//
//  TimeFormatter.swift
//  Handy Watch App
//
//  Created by Luca Lacerda on 21/05/24.
//

import Foundation

class TimeFormatter: Formatter{
    let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute,.second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    override func string(for obj: Any?) -> String? {
        guard let time = obj as? TimeInterval else { return nil }
        guard let formattedString = formatter.string(from: time) else { return nil }
        
        let subseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
        let separator = Locale.current.decimalSeparator ?? "."
        return String(format: "%@%@%0.2d", formattedString, separator, subseconds)
    }
}
