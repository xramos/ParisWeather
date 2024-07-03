//
//  ParisWeatherApp.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import SwiftUI

@main
struct ParisWeatherApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationStack {
                
                HomeView()
            }
        }
    }
}
