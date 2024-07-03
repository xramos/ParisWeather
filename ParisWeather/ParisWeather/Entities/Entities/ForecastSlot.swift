//
//  ForecastDay.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct ForecastSlot {
    
    let averageVisibility: Int
    let precipitationProbability: Int
    let dateTimeTxt: String
    let dateTime: Date?
    let temperature: Int
    let feelsLikeTemperature: Int
    let minTemperature: Int
    let maxTemperature: Int
    let pressure: Int
    let seaLevelPressure: Int
    let groundLevelPressure: Int
    let humidity: Int
    let weatherConditions: [WeatherCondition]
    let clouddiness: Int
    let windSpeed: Int
    let windDirection: Int
    let windGust: Double
    let partOfDay: PartOfDay
}
