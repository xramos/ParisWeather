//
//  GetForecastUseCase.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

protocol GetForecastUseCaseContract {
    func execute() -> AnyPublisher<Forecast, Error>
}

class GetForecastUseCase {
    
    private let repository: WeatherRepositoryContract
    
    init(repository: WeatherRepositoryContract = WeatherRepository()) {
        
        self.repository = repository
    }
}

extension GetForecastUseCase: GetForecastUseCaseContract {
    
    func execute() -> AnyPublisher<Forecast, Error> {
        
        return repository.getForecast()
    }
}
