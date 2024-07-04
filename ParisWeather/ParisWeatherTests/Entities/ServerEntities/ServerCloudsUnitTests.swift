//
//  ServerCloudsUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ServerCloudsUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let all = 50
        
        // When
        let response = CloudsMock().generateServerClouds(all: all)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.all, all)
    }
}
