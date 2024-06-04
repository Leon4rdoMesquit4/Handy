//
//  Font.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 04/06/24.
//

import Foundation
import SwiftUI

extension Font {
    enum Alata {
        case regular
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "Regular"
                
            case .custom(let name):
                return name
            }
        }
    }
    
    enum Poppins {
        case regular
        case italic
        case thin
        case thinItalic
        case extraLight
        case extraLightItalic
        case light
        case lightItalic
        case medium
        case mediumItalic
        case semiBold
        case semiBoldItalic
        case bold
        case boldItalic
        case extraBold
        case extraBoldItalic
        case black
        case blackItalic
        case custom(String)
        
        var value: String {
            switch self {
            case .custom(let name):
                return name
            case .regular:
                return "Regular"
            case .italic:
                return "Italic"
            case .thin:
                return "Thin"
            case .thinItalic:
                return "ThinItalic"
            case .extraLight:
                return "ExtraLight"
            case .extraLightItalic:
                return "ExtraLightItalic"
            case .light:
                return "Light"
            case .lightItalic:
                return "LightItalic"
            case .medium:
                return "Medium"
            case .mediumItalic:
                return "MediumItalic"
            case .semiBold:
                return "SemiBold"
            case .semiBoldItalic:
                return "SemiBoldItalic"
            case .bold:
                return "Bold"
            case .boldItalic:
                return "BoldItalic"
            case .extraBold:
                return "ExtraBold"
            case .extraBoldItalic:
                return "ExtraBoldItalic"
            case .black:
                return "Black"
            case .blackItalic:
                return "BlackItalic"
            }
        }
    }
    
    static func poppins(_ type: Poppins, size: CGFloat = 26, relativeTo: TextStyle) -> Font {
        return .custom("Poppins-\(type)", size: size, relativeTo: relativeTo)
    }
    
    static func alata(_ type: Alata, size: CGFloat = 26, relativeTo: TextStyle) -> Font {
        return .custom("Alata-\(type)", size: size, relativeTo: relativeTo)
    }

}
