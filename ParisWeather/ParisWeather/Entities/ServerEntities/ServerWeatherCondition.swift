//
//  ServerWeatherCondition.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct ServerWeatherCondition: Codable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    func convertToEntity() -> WeatherCondition {
        
        return WeatherCondition(id: id,
                                condition: main,
                                conditionDescription: description,
                                iconId: icon)
    }
}
