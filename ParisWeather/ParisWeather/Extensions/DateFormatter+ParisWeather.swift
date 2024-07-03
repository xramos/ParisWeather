//
//  DateFormatter+ParisWeather.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

extension DateFormatter {
    
    static let forecastDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = .current
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    static let weekDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}
