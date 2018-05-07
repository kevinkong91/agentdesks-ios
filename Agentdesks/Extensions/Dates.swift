//
//  Dates.swift
//  Agentdesks
//
//  Created by Kevin Kong on 5/6/18.
//  Copyright © 2018 Kevin Kong. All rights reserved.
//

import Foundation

extension Date {
    
    static func randomDate(daysBack: Int) -> Date {
        let day = Int.random(n: daysBack)
        let hour = Int.random(n: 23)
        let minute = Int.random(n: 59)
        
        let today = Date()
        let gregorian = Calendar(identifier: .gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -day
        offsetComponents.hour = hour
        offsetComponents.minute = minute
        
        let randomDate = gregorian.date(byAdding: offsetComponents, to: today)
        return randomDate ?? Date()
    }
}
