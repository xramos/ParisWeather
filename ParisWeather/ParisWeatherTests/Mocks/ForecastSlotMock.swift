//
//  ForecastSlotMock.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

@testable import ParisWeather

final class ForecastSlotMock {
    
    let visibility = 10000
    let pop = 0.2
    let dtTxt = "2024-07-03 12:00:00"
    let day = "Wednesday 3"
    let hour = "15:00"
    let temperature = 18
    let feelsLikeTemperature = 18
    let minTemperature = 18
    let maxTemperature = 20
    let pressure = 1013
    let seaLevelPressure = 1013
    let groundLevelPressure = 1002
    let humidity = 59
    let clouddiness = 100
    let windSpeed = 3
    let windDirection = 245
    let windGust = 6.59
    let partOfDay: PartOfDay = .day
    
    // MARK: - ServerForecastSlot
    
    func generateServerForecastSlot(visibility: Int? = nil,
                                    pop: Double? = nil,
                                    dtTxt: String? = nil) -> ServerForecastSlot {
        
        return ServerForecastSlot(visibility: visibility ?? self.visibility,
                                  pop: pop ?? self.pop,
                                  dtTxt: dtTxt ?? self.dtTxt,
                                  main: ForecastMainMock().generateServerForecastMain(),
                                  weather: [],
                                  clouds: CloudsMock().generateServerClouds(),
                                  wind: WindMock().generateServerWind(),
                                  sys: SysMock().generateServerSys())
    }
    
    // MARK: - ForecastSlot
    
    func generateForecastSlot(visibility: Int? = nil,
                              pop: Int? = nil,
                              dtTxt: String? = nil,
                              date: Date? = nil,
                              day: String? = nil,
                              hour: String? = nil,
                              temperature: Int? = nil,
                              feelsLikeTemperature: Int? = nil,
                              minTemperature: Int? = nil,
                              maxTemperature: Int? = nil,
                              pressure: Int? = nil,
                              seaLevelPressure: Int? = nil,
                              groundLevelPressure: Int? = nil,
                              humidity: Int? = nil,
                              clouddiness: Int? = nil,
                              windSpeed: Int? = nil,
                              windDirection: Int? = nil,
                              windGust: Double? = nil,
                              partOfDay: PartOfDay? = nil) -> ForecastSlot {
        
        return ForecastSlot(averageVisibility: visibility ?? self.visibility,
                            precipitationProbability: pop ?? Int(self.pop),
                            dateTimeTxt: dtTxt ?? self.dtTxt,
                            dateTime: date ?? Date(),
                            day: day ?? self.day,
                            hour: hour ?? self.hour,
                            temperature: temperature ?? self.temperature,
                            feelsLikeTemperature: feelsLikeTemperature ?? self.feelsLikeTemperature,
                            minTemperature: minTemperature ?? self.minTemperature,
                            maxTemperature: maxTemperature ?? self.maxTemperature,
                            pressure: pressure ?? self.pressure,
                            seaLevelPressure: seaLevelPressure ?? self.seaLevelPressure,
                            groundLevelPressure: groundLevelPressure ?? self.groundLevelPressure,
                            humidity: humidity ?? self.humidity,
                            weatherConditions: [],
                            clouddiness: clouddiness ?? self.clouddiness,
                            windSpeed: windSpeed ?? self.windSpeed,
                            windDirection: windDirection ?? self.windDirection,
                            windGust: windGust ?? self.windGust,
                            partOfDay: partOfDay ?? self.partOfDay)
    }
}
