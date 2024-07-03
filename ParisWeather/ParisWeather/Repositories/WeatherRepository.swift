//
//  WeatherRepository.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

protocol WeatherRepository {
 
    func getForecast() -> AnyPublisher<Forecast, Error>
}
