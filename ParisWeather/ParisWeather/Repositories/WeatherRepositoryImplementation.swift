//
//  WeatherRepositoryImplementation.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

class WeatherRepositoryImplementation {
    
    private let remoteDataSource: RemoteWeatherDataSource
    
    init(remoteDataSource: RemoteWeatherDataSource = RemoteWeatherDataSource()) {
        
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - WeatherRepository

extension WeatherRepositoryImplementation: WeatherRepository {
    
    func getForecast() -> AnyPublisher<Forecast, Error> {
        
        return remoteDataSource.getForecast().map { serverForecast -> Forecast in
            
            return serverForecast.convertToEntity()
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
