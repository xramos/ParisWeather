//
//  GetForecastUseCaseImplementation.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 15/7/24.
//

import Foundation
import Combine

class GetForecastUseCaseImplementation {
    
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository = WeatherRepositoryImplementation()) {
        
        self.repository = repository
    }
}

extension GetForecastUseCaseImplementation: GetForecastUseCase {
    
    func execute() -> AnyPublisher<Forecast, Error> {
        
        return repository.getForecast()
    }
}
