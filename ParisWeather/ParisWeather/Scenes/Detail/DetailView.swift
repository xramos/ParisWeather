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
                    
                    ForecastDetailCardView(hour: slot.hour,
                                           temperature: slot.temperature,
                                           maxTemperature: slot.maxTemperature,
                                           minTemperature: slot.minTemperature,
                                           windSpeed: slot.windSpeed,
                                           precipitation: slot.precipitationProbability,
                                           feelsLikeTemperature: slot.feelsLikeTemperature,
                                           visibility: slot.averageVisibility,
                                           clouddiness: slot.clouddiness,
                                           humidity: slot.humidity,
                                           weatherIcon: slot.weatherConditions.first?.iconId ?? "")
                }
            }
            .padding(Constants.padding)
        }
        .navigationTitle(viewModel.slots.first?.day ?? "")
    }
}

#Preview {
    DetailView(slots: [])
}
