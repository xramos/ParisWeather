//
//  WindMock.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

@testable import ParisWeather

final class WindMock {
    
    let speed = 3.96
    let deg = 245
    let gust = 6.59
    
    // MARK: - ServerWind
    
    func generateServerWind(speed: Double? = nil,
                            deg: Int? = nil,
                            gust: Double? = nil) -> ServerWind {
        
        return ServerWind(speed: speed ?? self.speed,
                          deg: deg ?? self.deg,
                          gust: gust ?? self.gust)
    }
}
