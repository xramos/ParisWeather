//
//  GetForecastUseCase.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

protocol GetForecastUseCase {
    
    func execute() -> AnyPublisher<Forecast, Error>
}
