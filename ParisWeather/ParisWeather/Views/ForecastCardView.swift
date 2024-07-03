//
//  ForecastCardView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import SwiftUI

struct ForecastCardView: View {
    
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    let pressure: Int
    let humidity: Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("\(temperature)")
        }
        .padding(Constants.padding)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous))
    }
}

#Preview {
    ForecastCardView(temperature: 18.97, 
                     minTemperature: 18.46,
                     maxTemperature: 20.74,
                     pressure: 1013,
                     humidity: 59)
}
