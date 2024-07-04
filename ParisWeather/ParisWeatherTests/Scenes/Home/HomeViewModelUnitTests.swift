//
//  HomeViewModelUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest

@testable import ParisWeather

final class HomeViewModelUnitTests: XCTestCase {

    var sut: HomeViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetForecastSlotsEmpty() {
     
        // Given
        let dayValue = 1
        let forecastSlots: [ForecastSlot] = []
        
        // When
        let response = sut?.getForecastSlot(list: forecastSlots, value: dayValue)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.count, 0)
    }
    
    func testGetForecastSlotsToday() {
        
        // Given
        let dayValue = 0
        let forecastSlots: [ForecastSlot] = [ForecastSlotMock().generateForecastSlot(date: Calendar.current.getSpecificDate(value: dayValue)),
                                             ForecastSlotMock().generateForecastSlot(date: Calendar.current.getSpecificDate(value: dayValue))]
        
        // When
        let response = sut?.getForecastSlot(list: forecastSlots, value: dayValue)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.count, 2)
    }
    
    func testGetForecastSlotsSpecificDay() {
        
        // Given
        let dayValue = 2
        let forecastSlots: [ForecastSlot] = [ForecastSlotMock().generateForecastSlot(date: Calendar.current.getSpecificDate(value: dayValue)),
                                             ForecastSlotMock().generateForecastSlot(date: Calendar.current.getSpecificDate(value: dayValue)),
                                             ForecastSlotMock().generateForecastSlot(date: Calendar.current.getSpecificDate(value: 0)),
                                             ForecastSlotMock().generateForecastSlot(date: Calendar.current.getSpecificDate(value: dayValue))]
        
        // When
        let response = sut?.getForecastSlot(list: forecastSlots, value: dayValue)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.count, 3)
    }
}
