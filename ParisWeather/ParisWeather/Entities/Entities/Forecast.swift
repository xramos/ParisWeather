//
//  Forecast.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct Forecast {
    
    let list: [ForecastSlot]
}

extension Forecast {
    
    func getForecastSlot(date: Date) -> [ForecastSlot] {
        
        var dateSlots: [ForecastSlot] = []
        
        for slot in list {
            
            if let slotDate = slot.dateTime,
                Calendar.current.isSameDay(first: date, second: slotDate) {
                
                dateSlots.append(slot)
            }
        }
        
        return dateSlots
    }
}
