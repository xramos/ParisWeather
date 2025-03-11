//
//  WeatherRepository.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

protocol WeatherRepositoryContract {
    func getForecast() -> AnyPublisher<Forecast, Error>
}

class WeatherRepository {
    
    private let remoteDataSource: RemoteWeatherDataSourceContract
    
    init(remoteDataSource: RemoteWeatherDataSourceContract = RemoteWeatherDataSource()) {
        
        self.remoteDataSource = remoteDataSource
    }
}

extension WeatherRepository: WeatherRepositoryContract {
    
    func getForecast() -> AnyPublisher<Forecast, Error> {
        
        return remoteDataSource.getForecast().map { serverForecast -> Forecast in
            
            return serverForecast.convertToEntity()
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
