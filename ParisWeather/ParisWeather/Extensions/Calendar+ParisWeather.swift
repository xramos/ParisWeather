//
//  Calendar+ParisWeather.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

extension Calendar {
    
    func isSameDay(first: Date, second: Date) -> Bool {
        
        return Calendar.current.isDate(first, equalTo: second, toGranularity: .day)
    }
    
    func getSpecificDate(value: Int) -> Date {
        
        return Calendar.current.date(byAdding: .day, value: value, to: Date())!
    }
}
