//
//  Date+Format.swift
//  Handy Watch App
//
//  Created by Caio Marques on 29/05/24.
//

import Foundation

// Padrão de salvamento da Date no UserDefaults: dd_mm_yyyy
extension Date {
    /// A função que transforma uma Date em uma String formatada do jeito que a gente vai salvar ela dentro do UserDefaults.
    static func convertDateToString (_ date : Date) -> String {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let stringFormatted = "\(components.day ?? 1)_\(components.month ?? 1)_\(components.year ?? 2000)"
        return stringFormatted
    }
    
    /// A função que transforma uma String do UserDefaults que a gente vai usar dentro do nosso projeto.
    static func convertStringToDate (_ string : String) -> Date? {
        let components = string.split(separator: "_")
        let day = Int(components[0])
        let month = Int(components[1])
        let year = Int(components[2])
        
        let dateComponents = DateComponents(year: year, month: month, day: day)
        let date = Calendar.current.date(from: dateComponents)
        
        return date
    }
}
