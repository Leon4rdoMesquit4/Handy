//
//  Extensions.swift
//  Handy Watch App
//
//  Created by Leonardo Mesquita Alves on 22/05/24.
//

import Foundation
import SwiftUI

struct IsExercising: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isExercising: Bool {
        get { self[IsExercising.self] }
        set { self[IsExercising.self] = newValue }
    }
}


