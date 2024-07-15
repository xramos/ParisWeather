//
//  MockGetForecastUseCase.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation
import Combine

@testable import ParisWeather

class MockGetForecastUseCase: GetForecastUseCase {
    
    var isExecuteCalled: Bool = false
    
    @discardableResult func execute() -> AnyPublisher<Forecast, Error> {
        
        isExecuteCalled = true
        
        // We don't care about the return result
        return Result.Publisher(NetworkError.invalidResponse).eraseToAnyPublisher()
    }
}
