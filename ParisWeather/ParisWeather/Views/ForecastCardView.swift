//
//  ForecastCardView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import SwiftUI

struct ForecastCardView: View {
    
    let temperature: Int
    let minTemperature: Int
    let maxTemperature: Int
    let precipitation: Int
    let humidity: Int
    let wind: Int
    let weatherIcon: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weatherIcon)@2x.png")) { image in
                
                    image.image?.resizable()
                }
                .frame(width: 48, height: 48)
                
                VStack(alignment: .leading) {
                    
                    Text("\(temperature)°C")
                        .font(.title)
                        .foregroundStyle(Color.accentColor)
                 
                    HStack {
                        Text("H: \(maxTemperature)°C")
                            .font(.caption)
                            .foregroundStyle(Color.neutralText)
                        
                        
                        Text("L: \(minTemperature)°C")
                            .font(.caption)
                            .foregroundStyle(Color.neutralText)
                    }
                }
                
                Spacer()
             
                VStack(alignment: .leading) {
                    
                    Text("Precipitation: \(precipitation)%")
                        .font(.footnote)
                        .foregroundStyle(Color.neutralText)
                    
                    Text("Humidity: \(humidity)%")
                        .font(.footnote)
                        .foregroundStyle(Color.neutralText)
                    
                    Text("Wind: \(wind) km/h")
                        .font(.footnote)
                        .foregroundStyle(Color.neutralText)
                }
            }
        }
        .padding(Constants.padding)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous).stroke(Color.neutral, lineWidth: 2)
        }
    }
}

#Preview {
    ForecastCardView(temperature: 18,
                     minTemperature: 17,
                     maxTemperature: 20,
                     precipitation: 2,
                     humidity: 59,
                     wind: 3,
                     weatherIcon: "04d")
}
