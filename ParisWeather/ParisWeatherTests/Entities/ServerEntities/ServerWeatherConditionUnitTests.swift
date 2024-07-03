//
//  ServerWeatherConditionUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ServerWeatherConditionUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let id = 804
        let main = "Clouds"
        let description = "overcast clouds"
        let icon = "04d"
     
        // When
        let response = WeatherConditionMock().generateSeverWeatherCondition(id: id,
                                                                            main: main,
                                                                            description: description,
                                                                            icon: icon)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.id, id)
        XCTAssertEqual(response.main, main)
        XCTAssertEqual(response.description, description)
        XCTAssertEqual(response.icon, icon)
    }
    
    func testConvertToEntity() {
        
        // Given
        let request = WeatherConditionMock().generateSeverWeatherCondition()
        
        // When
        let response = request.convertToEntity()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.id, request.id)
        XCTAssertEqual(response.condition, request.main)
        XCTAssertEqual(response.conditionDescription, request.description)
        XCTAssertEqual(response.iconId, request.icon)
    }
}
