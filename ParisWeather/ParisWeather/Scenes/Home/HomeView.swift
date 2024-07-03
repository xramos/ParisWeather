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
                                     precipitation: forecast1.precipitationProbability,
                                     humidity: forecast1.humidity,
                                     wind: forecast1.windSpeed,
                                     weatherIcon: forecast1.weatherConditions.first?.iconId ?? "")
                }
                
                if let forecast2 = viewModel.slots2.first {
                    
                    ForecastCardView(temperature: forecast2.temperature,
                                     minTemperature: forecast2.minTemperature,
                                     maxTemperature: forecast2.maxTemperature,
                                     precipitation: forecast2.precipitationProbability,
                                     humidity: forecast2.humidity,
                                     wind: forecast2.windSpeed,
                                     weatherIcon: forecast2.weatherConditions.first?.iconId ?? "")
                }
                
                if let forecast3 = viewModel.slots3.first {
                 
                    ForecastCardView(temperature: forecast3.temperature,
                                     minTemperature: forecast3.minTemperature,
                                     maxTemperature: forecast3.maxTemperature,
                                     precipitation: forecast3.precipitationProbability,
                                     humidity: forecast3.humidity,
                                     wind: forecast3.windSpeed,
                                     weatherIcon: forecast3.weatherConditions.first?.iconId ?? "")
                }
                
                if let forecast4 = viewModel.slots4.first {
                    
                    ForecastCardView(temperature: forecast4.temperature,
                                     minTemperature: forecast4.minTemperature,
                                     maxTemperature: forecast4.maxTemperature,
                                     precipitation: forecast4.precipitationProbability,
                                     humidity: forecast4.humidity,
                                     wind: forecast4.windSpeed,
                                     weatherIcon: forecast4.weatherConditions.first?.iconId ?? "")
                }
                
                if let forecast5 = viewModel.slots5.first {
                    
                    ForecastCardView(temperature: forecast5.temperature,
                                     minTemperature: forecast5.minTemperature,
                                     maxTemperature: forecast5.maxTemperature,
                                     precipitation: forecast5.precipitationProbability,
                                     humidity: forecast5.humidity,
                                     wind: forecast5.windSpeed,
                                     weatherIcon: forecast5.weatherConditions.first?.iconId ?? "")
                }
            }
            .padding(Constants.padding)
        }
        .navigationTitle("Paris Forecast")
        .task {
            
            viewModel.getForecast()
        }
    }
}

#Preview {
    HomeView()
}
