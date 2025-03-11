//
//  DetailView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 4/7/24.
//

import SwiftUI

struct DetailView: View {
    
    var viewModel: DetailViewModelContract
    
    @State var slots: [ForecastSlot] = []
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                ForEach(slots) { slot in
                    
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
        .navigationTitle(slots.first?.day ?? "")
        .onReceive(viewModel.slotsPublisher) {
            slots = $0
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(slots: []))
}
