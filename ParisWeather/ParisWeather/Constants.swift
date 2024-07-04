//
//  Constants.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct Constants {
    
    static let baseURL = "https://api.openweathermap.org"
    
    static let apiKey = "e8e38c6f30b5883e3fef3489cecdbbd6"
    
    static let padding: CGFloat = 8
    
    static let cornerRadius: CGFloat = 10
    
    static let iconHeight: CGFloat = 80
    
    static let iconUrl = "https://openweathermap.org/img/wn/%@@2x.png"
    
    static let tempString = "%@°C"
    static let maxTempString = "H: %@°C"
    static let minTempString = "L: %@°C"
    static let precipitationString = "Precipitation: %@%@"
    static let humidityString = "Humidity: %@%@"
    static let windString = "Wind: %@ m/s"
}
