//
//  User.swift
//  Handy
//
//  Created by Caio Marques on 20/05/24.
//

import Foundation

class User {
    var username : String
    var beginningDate : Date
    var endTreatment : Date?
    var goal : Goal
    
    init(username: String, beginningDate: Date, endTreatment: Date? = nil, goal: Goal) {
        self.username = username
        self.beginningDate = beginningDate
        self.endTreatment = endTreatment
        self.goal = goal
    }
}
