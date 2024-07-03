//
//  GetForecastUseCase.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

class GetForecastUseCase {
    
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository = WeatherRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<Forecast, Error> {
        
        return repository.getForecast()
    }
}
