//
//  RemoteWeatherDataSourceUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class RemoteWeatherDataSourceUnitTests: XCTestCase {

    var sut: RemoteWeatherDataSource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = RemoteWeatherDataSource(baseURLString: "http://jsonplaceholder.typicode.com")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetWeatherEndpoint() {
     
        // When
        let response = sut!.getForecastEndpoint()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/data/2.5/forecast")
    }
}
