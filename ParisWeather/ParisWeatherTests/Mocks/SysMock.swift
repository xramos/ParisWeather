//
//  SysMock.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

@testable import ParisWeather

final class SysMock {
    
    let pod = "d"
    
    // MARK: - ServerSys
    
    func generateServerSys(pod: String? = nil) -> ServerSys {
        
        return ServerSys(pod: pod ?? self.pod)
    }
}
