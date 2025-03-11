//
//  GetForecastUseCaseUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class GetForecastUseCaseUnitTests: XCTestCase {

    var sut: GetForecastUseCase?

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testIsCalled() {
     
        // Given
        let repository = MockWeatherRepository()
        sut = GetForecastUseCase(repository: repository)
        
        // When
        _  = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetForecastCalled)
    }
}
