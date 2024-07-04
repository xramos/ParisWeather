//
//  ServerSysMockUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class ServerSysMockUnitTests: XCTestCase {

    func testInit() {
        
        // Given
        let pod = "d"
        
        // When
        let response = SysMock().generateServerSys(pod: pod)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.pod, pod)
    }
}
