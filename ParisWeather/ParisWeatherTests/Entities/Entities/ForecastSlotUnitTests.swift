//
//  ForecastSlotUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ForecastSlotUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let visibility = 10000
        let pop = 20
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
        
        // When
        let response = ForecastSlotMock().generateForecastSlot(visibility: visibility,
                                                               pop: pop,
                                                               dtTxt: dtTxt,
                                                               day: day,
                                                               hour: hour,
                                                               temperature: temperature,
                                                               feelsLikeTemperature: feelsLikeTemperature,
                                                               minTemperature: minTemperature,
                                                               maxTemperature: maxTemperature,
                                                               pressure: pressure,
                                                               seaLevelPressure: seaLevelPressure,
                                                               groundLevelPressure: groundLevelPressure,
                                                               humidity: humidity,
                                                               clouddiness: clouddiness,
                                                               windSpeed: windSpeed,
                                                               windDirection: windDirection,
                                                               windGust: windGust,
                                                               partOfDay: partOfDay)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.averageVisibility, visibility)
        XCTAssertEqual(response.precipitationProbability, pop)
        XCTAssertEqual(response.dateTimeTxt, dtTxt)
        XCTAssertEqual(response.day, day)
        XCTAssertEqual(response.hour, hour)
        XCTAssertEqual(response.temperature, temperature)
        XCTAssertEqual(response.feelsLikeTemperature, feelsLikeTemperature)
        XCTAssertEqual(response.minTemperature, minTemperature)
        XCTAssertEqual(response.maxTemperature, maxTemperature)
        XCTAssertEqual(response.pressure, pressure)
        XCTAssertEqual(response.seaLevelPressure, seaLevelPressure)
        XCTAssertEqual(response.groundLevelPressure, groundLevelPressure)
        XCTAssertEqual(response.humidity, humidity)
        XCTAssertEqual(response.clouddiness, clouddiness)
        XCTAssertEqual(response.windSpeed, windSpeed)
        XCTAssertEqual(response.windDirection, windDirection)
        XCTAssertEqual(response.windGust, windGust)
        XCTAssertEqual(response.partOfDay, partOfDay)
    }
}
