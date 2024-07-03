//
//  MockWeatherRepository.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

@testable import ParisWeather

class MockWeatherRepository: WeatherRepository {
    
    var isGetForecastCalled: Bool = false
    
    @discardableResult func getForecast() -> AnyPublisher<Forecast, Error> {
        
        isGetForecastCalled = true
        
        // We don't care about the return result
        return Result.Publisher(Forecast(list: [])).eraseToAnyPublisher()
    }
}
