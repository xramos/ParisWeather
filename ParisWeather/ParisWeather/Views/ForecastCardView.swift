//
//  ForecastCardView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import SwiftUI
import PreviewSnapshots

struct ForecastCardView: View {
    
    let date: String
    let temperature: Int
    let minTemperature: Int
    let maxTemperature: Int
    let precipitation: Int
    let humidity: Int
    let wind: Int
    let weatherIcon: String
    
    var body: some View {
        
        ZStack {
            
            contentView
        }
        .padding(Constants.padding)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .stroke(Color.neutral, lineWidth: 1)
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        
        HStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                
                Text(date)
                    .font(.callout)
                    .foregroundStyle(Color.neutralText)
                    .fontWeight(.bold)
                
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
            
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weatherIcon)@2x.png")) { image in
                
                image.image?.resizable()
            }
            .frame(width: 80, height: 80)
         
            VStack(alignment: .leading, spacing: 8) {
                
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
}

struct ForecastCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { state in
                
            ForecastCardView(date: "Wednesday 3",
                             temperature: 18,
                             minTemperature: 17,
                             maxTemperature: 20,
                             precipitation: 2,
                             humidity: 59,
                             wind: 3,
                             weatherIcon: "04d")
        })
    }
}
