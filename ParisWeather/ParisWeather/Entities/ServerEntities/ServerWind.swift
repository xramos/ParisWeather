//
//  ServerWind.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

struct ServerWind: Codable {
    
    let speed: Double
    let deg: Int
    let gust: Double
}
