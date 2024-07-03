//
//  ServerForecastSlotUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ServerForecastSlotUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let visibility = 10000
        let pop = 0.2
        let dtTxt = "2024-07-03 12:00:00"
        
        // When
        let response = ForecastSlotMock().generateServerForecastSlot(visibility: visibility,
                                                                     pop: pop,
                                                                     dtTxt:dtTxt)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.visibility, visibility)
        XCTAssertEqual(response.pop, pop)
        XCTAssertEqual(response.dtTxt, dtTxt)
    }

    func testConvertToEntity() {
        
        // Given
        let request = ForecastSlotMock().generateServerForecastSlot()
        
        // When
        let response = request.convertToEntity()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.averageVisibility, request.visibility)
        XCTAssertEqual(response.precipitationProbability, Int(request.pop*100))
        XCTAssertEqual(response.dateTimeTxt, request.dtTxt)
    }
}
