//
//  WeatherConditionUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class WeatherConditionUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let id = 804
        let condition = "Clouds"
        let conditionDescription = "overcast clouds"
        let iconId = "04d"
        
        // When
        let response = WeatherConditionMock().generateWeatherCondition(id: id,
                                                                       condition: condition,
                                                                       conditionDescription: conditionDescription,
                                                                       iconId: iconId)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.id, id)
        XCTAssertEqual(response.condition, condition)
        XCTAssertEqual(response.conditionDescription, conditionDescription)
        XCTAssertEqual(response.iconId, iconId)
    }
}
