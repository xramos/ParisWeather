//
//  ForecastMainMock.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

@testable import ParisWeather

final class ForecastMainMock {
    
    let temp = 18.97
    let feelsLike = 18.46
    let tempMin = 18.97
    let tempMax = 20.74
    let pressure = 1013
    let seaLevel = 1013
    let grndLevel = 1002
    let humidity = 59
    
    // MARK: - ServerForecastMain
    
    func generateServerForecastMain(temp: Double? = nil,
                                    feelsLike: Double? = nil,
                                    tempMin: Double? = nil,
                                    tempMax: Double? = nil,
                                    pressure: Int? = nil,
                                    seaLevel: Int? = nil,
                                    grndLevel: Int? = nil,
                                    humidity: Int? = nil) -> ServerForecastMain {
            
        return ServerForecastMain(temp: temp ?? self.temp,
                                  feelsLike: feelsLike ?? self.feelsLike,
                                  tempMin: tempMin ?? self.tempMin,
                                  tempMax: tempMax ?? self.tempMax,
                                  pressure: pressure ?? self.pressure,
                                  seaLevel: seaLevel ?? self.seaLevel,
                                  grndLevel: grndLevel ?? self.grndLevel,
                                  humidity: humidity ?? self.humidity)
        }
}
