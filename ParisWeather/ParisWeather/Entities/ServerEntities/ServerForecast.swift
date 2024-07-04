//
//  ServerForecast.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct ServerForecast: Codable {
    
    let list: [ServerForecastSlot]
    
    func convertToEntity() -> Forecast {
        
        var forecastSlot: [ForecastSlot] = []
        
        for forecast in list {
            forecastSlot.append(forecast.convertToEntity())
        }
        
        return Forecast(list: forecastSlot)
    }
}
