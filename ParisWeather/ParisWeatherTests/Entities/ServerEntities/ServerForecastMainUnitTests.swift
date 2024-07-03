//
//  ServerForecastMainUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ServerForecastMainUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let temp = 18.97
        let feelsLike = 18.46
        let tempMin = 18.97
        let tempMax = 20.74
        let pressure = 1013
        let seaLevel = 1013
        let grndLevel = 1002
        let humidity = 59
        
        // When
        let response = ForecastMainMock().generateServerForecastMain(temp: temp,
                                                                     feelsLike: feelsLike,
                                                                     tempMin: tempMin,
                                                                     tempMax: tempMax,
                                                                     pressure: pressure,
                                                                     seaLevel: seaLevel,
                                                                     grndLevel: grndLevel,
                                                                     humidity: humidity)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.temp, temp)
        XCTAssertEqual(response.feelsLike, feelsLike)
        XCTAssertEqual(response.pressure, pressure)
        XCTAssertEqual(response.seaLevel, seaLevel)
        XCTAssertEqual(response.grndLevel, grndLevel)
        XCTAssertEqual(response.humidity, humidity)
    }
}
