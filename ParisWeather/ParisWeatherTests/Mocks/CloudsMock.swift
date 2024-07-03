//
//  CloudsMock.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

@testable import ParisWeather

final class CloudsMock {
    
    let all = 100
    
    // MARK: - ServerClouds
    
    func generateServerClouds(all: Int? = nil) -> ServerClouds {
        
        return ServerClouds(all: all ?? self.all)
    }
}
