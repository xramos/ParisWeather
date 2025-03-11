//
//  HomeView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import SwiftUI

struct HomeView: View {
    
    var viewModel: HomeViewModelContract
    
    @State var isDetailActive: Bool = false
    
    @State var slots1: [ForecastSlot] = []
    @State var slots2: [ForecastSlot] = []
    @State var slots3: [ForecastSlot] = []
    @State var slots4: [ForecastSlot] = []
    @State var slots5: [ForecastSlot] = []
    
    @State var selectedSlots: [ForecastSlot] = []
    
    var body: some View {
        
        ScrollView {
            
            contentView
            .padding(Constants.padding)
        }
        .navigationTitle("Paris Forecast")
        .task {
            
            isDetailActive = false
            viewModel.getForecast()
        }
        .navigationDestination(isPresented: $isDetailActive) {
            
            DetailView(viewModel: DetailViewModel(slots: selectedSlots))
            
        }.onReceive(viewModel.slots1Publisher) {
            slots1 = $0
        }.onReceive(viewModel.slots2Publisher) {
            slots2 = $0
        }.onReceive(viewModel.slots3Publisher) {
            slots3 = $0
        }.onReceive(viewModel.slots4Publisher) {
            slots4 = $0
        }.onReceive(viewModel.slots5Publisher) {
            slots5 = $0
        }
    }
}

private extension HomeView {
    
    @ViewBuilder
    var contentView: some View {
        VStack {
            forecastView(for: slots1)
            forecastView(for: slots2)
            forecastView(for: slots3)
            forecastView(for: slots4)
            forecastView(for: slots5)
        }
    }
    
    @ViewBuilder
    func forecastView(for slots: [ForecastSlot]) -> some View {
        if let forecast = slots.first {
            ForecastCardView(date: forecast.day,
                             temperature: forecast.temperature,
                             minTemperature: forecast.minTemperature,
                             maxTemperature: forecast.maxTemperature,
                             precipitation: forecast.precipitationProbability,
                             humidity: forecast.humidity,
                             wind: forecast.windSpeed,
                             weatherIcon: forecast.weatherConditions.first?.iconId ?? "")
            .onTapGesture {
                self.selectedSlots = slots
                isDetailActive = true
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
