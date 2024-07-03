//
//  ServerWindMockUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ServerWindMockUnitTests: XCTestCase {

    func testInit() {
     
        // Given
        let speed = 3.96
        let deg = 245
        let gust = 6.59
        
        // When
        let response = WindMock().generateServerWind(speed: speed,
                                                     deg: deg,
                                                     gust: gust)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.speed, speed)
        XCTAssertEqual(response.deg, deg)
        XCTAssertEqual(response.gust, gust)
    }
}
