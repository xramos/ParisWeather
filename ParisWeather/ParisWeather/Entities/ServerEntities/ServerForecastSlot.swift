//
//  ServerForecastDay.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct ServerForecastSlot: Codable {
    
    let visibility: Int
    let pop: Double
    let dtTxt: String
    
    let main: ServerForecastMain
    let weather: [ServerWeatherCondition]
    let clouds: ServerClouds
    let wind: ServerWind
    let sys: ServerSys
    
    func convertToEntity() -> ForecastSlot {
        
        return ForecastSlot(averageVisibility: visibility,
                            precipitationProbability: Int(pop*100),
                            dateTimeTxt: dtTxt,
                            dateTime: getDate(),
                            day: getDay(),
                            temperature: Int(main.temp),
                            feelsLikeTemperature: Int(main.feelsLike),
                            minTemperature: Int(main.tempMin),
                            maxTemperature: Int(main.tempMax),
                            pressure: main.pressure,
                            seaLevelPressure: main.seaLevel,
                            groundLevelPressure: main.grndLevel,
                            humidity: main.humidity,
                            weatherConditions: getWeatherConditions(),
                            clouddiness: clouds.all,
                            windSpeed: Int(wind.speed),
                            windDirection: wind.deg,
                            windGust: wind.gust,
                            partOfDay: getPartOfDay())
    }
}

fileprivate extension ServerForecastSlot {
    
    func getWeatherConditions() -> [WeatherCondition] {
        
        var weatherConditions: [WeatherCondition] = []
        
        for serverWeather in weather {
            weatherConditions.append(serverWeather.convertToEntity())
        }
        
        return weatherConditions
    }
    
    func getDate() -> Date? {
        
        let formatter = DateFormatter.forecastDate
        
        return formatter.date(from: dtTxt)
    }
    
    func getPartOfDay() -> PartOfDay {
        
        if sys.pod == "n" {
            return PartOfDay.night
        } else if sys.pod == "d" {
            return PartOfDay.day
        } else {
            return PartOfDay.unknown
        }
    }
    
    func getDay() -> String {
        
        if let date = getDate() {
            
            let formatter = DateFormatter.weekDay
            
            let dayOfWeek = formatter.string(from: date)
            
            let numDay = Calendar.current.dateComponents([.day], from: date).day!
            
            return "\(dayOfWeek) \(numDay)"
            
        } else {
            
            return ""
        }
    }
}
