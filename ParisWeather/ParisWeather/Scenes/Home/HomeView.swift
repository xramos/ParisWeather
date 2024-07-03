//
//  HomeView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                if let forecast1 = viewModel.slots1.first {
                    
                    ForecastCardView(temperature: forecast1.temperature,
                                     minTemperature: forecast1.minTemperature,
                                     maxTemperature: forecast1.maxTemperature,
                                     pressure: forecast1.pressure,
                                     humidity: forecast1.humidity)
                }
                
                if let forecast2 = viewModel.slots2.first {
                    
                    ForecastCardView(temperature: forecast2.temperature,
                                     minTemperature: forecast2.minTemperature,
                                     maxTemperature: forecast2.maxTemperature,
                                     pressure: forecast2.pressure,
                                     humidity: forecast2.humidity)
                }
                
                if let forecast3 = viewModel.slots3.first {
                 
                    ForecastCardView(temperature: forecast3.temperature,
                                     minTemperature: forecast3.minTemperature,
                                     maxTemperature: forecast3.maxTemperature,
                                     pressure: forecast3.pressure,
                                     humidity: forecast3.humidity)
                }
                
                if let forecast4 = viewModel.slots4.first {
                    
                    ForecastCardView(temperature: forecast4.temperature,
                                     minTemperature: forecast4.minTemperature,
                                     maxTemperature: forecast4.maxTemperature,
                                     pressure: forecast4.pressure,
                                     humidity: forecast4.humidity)
                }
                
                if let forecast5 = viewModel.slots5.first {
                    
                    ForecastCardView(temperature: forecast5.temperature,
                                     minTemperature: forecast5.minTemperature,
                                     maxTemperature: forecast5.maxTemperature,
                                     pressure: forecast5.pressure,
                                     humidity: forecast5.humidity)
                }
            }
        }
        .task {
            
            viewModel.getForecast()
        }
    }
}

#Preview {
    HomeView()
}
