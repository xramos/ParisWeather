//
//  ForecastDay.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct ForecastSlot: Identifiable {
    
    let id: String = UUID().uuidString
    let averageVisibility: Int
    let precipitationProbability: Int
    let dateTimeTxt: String
    let dateTime: Date?
    let day: String
    let hour: String
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
