//
//  WeatherConditionMock.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

@testable import ParisWeather

final class WeatherConditionMock {
    
    let id = 804
    let main = "Clouds"
    let description = "overcast clouds"
    let icon = "04d"
    
    // MARK: - ServerWeatherCondition
    
    func generateSeverWeatherCondition(id: Int? = nil,
                                       main: String? = nil,
                                       description: String? = nil,
                                       icon: String? = nil) -> ServerWeatherCondition {
        
        return ServerWeatherCondition(id: id ?? self.id,
                                      main: main ?? self.main,
                                      description: description ?? self.description,
                                      icon: icon ?? self.icon)
    }
    
    // MARK: - WeatherCondition
    
    func generateWeatherCondition(id: Int? = nil,
                                  condition: String? = nil,
                                  conditionDescription: String? = nil,
                                  iconId: String? = nil) -> WeatherCondition {
        
        return WeatherCondition(id: id ?? self.id,
                                condition: condition ?? self.main,
                                conditionDescription: conditionDescription ?? self.description,
                                iconId: iconId ?? self.icon)
    }
}
