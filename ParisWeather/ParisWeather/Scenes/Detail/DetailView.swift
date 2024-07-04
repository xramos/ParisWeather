//
//  DetailView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 4/7/24.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel = DetailViewModel()
    
    init(slots: [ForecastSlot]) {
        self.viewModel.slots = slots
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                ForEach(viewModel.slots) { slot in
                    
                    ForecastCardView(date: slot.day,
                                     temperature: slot.temperature,
                                     minTemperature: slot.minTemperature,
                                     maxTemperature: slot.maxTemperature,
                                     precipitation: slot.precipitationProbability,
                                     humidity: slot.humidity,
                                     wind: slot.windSpeed,
                                     weatherIcon: slot.weatherConditions.first?.iconId ?? "")
                }
            }
            .padding(Constants.padding)
        }
    }
}

#Preview {
    DetailView(slots: [])
}
