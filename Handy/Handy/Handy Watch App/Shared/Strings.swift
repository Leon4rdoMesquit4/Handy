//
//  Strings.swift
//  Handy Watch App
//
//  Created by Bruno Teodoro on 20/05/24.
//

import Foundation

extension String {
    func getTimeString() -> String? {
        
        let time = self
        
        guard let value = TimeInterval(time) else { return nil }
        
        var seconds = Int(value - value.truncatingRemainder(dividingBy: 1))
        let hundreths = Int(value.truncatingRemainder(dividingBy: 1) * 100)
        let minutes = seconds/60
        
        if seconds.isMultiple(of: 60) {
            seconds = 0
            
            if minutes < 10 {
                if hundreths < 10 {
                    return String(format:"0%d:00.0%d", minutes,seconds,hundreths)
                }
                return String(format:"0%d:00.%d", minutes,seconds,hundreths)
            } else {
                if hundreths < 10 {
                    return String(format:"%d:00.0%d", minutes,seconds,hundreths)
                }
                return String(format:"%d:00.%d", minutes,seconds,hundreths)
            }
        }
        
        seconds = seconds - (60*minutes)
        
        if seconds < 10{
            
            if minutes < 10 {
                
                if hundreths < 10 {
                    return String(format:"0%d:0%d.0%d", minutes,seconds,hundreths)
                }
                return String(format:"0%d:0%d.%d", minutes,seconds,hundreths)
                
            } else {
                
                if hundreths < 10 {
                    return String(format:"%d:0%d.0%d", minutes,seconds,hundreths)
                }
                return String(format:"%d:0%d.%d", minutes,seconds,hundreths)
                
            }
            
        } else {
            
            if minutes < 10 {
                
                if hundreths < 10 {
                    return String(format:"0%d:%d.0%d", minutes,seconds,hundreths)
                }
                return String(format:"0%d:%d.%d", minutes,seconds,hundreths)
                
            } else {
                
                if hundreths < 10 {
                    return String(format:"%d:%d.0%d", minutes,seconds,hundreths)
                }
                return String(format:"%d:%d.%d", minutes,seconds,hundreths)
                
            }
            
        }
    }
}
