//
//  ForecastDetailCardView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 5/7/24.
//

import SwiftUI
import PreviewSnapshots

struct ForecastDetailCardView: View {
    
    let hour: String
    let temperature: Int
    let maxTemperature: Int
    let minTemperature: Int
    let windSpeed: Int
    let precipitation: Int
    let feelsLikeTemperature: Int
    let visibility: Int
    let clouddiness: Int
    let humidity: Int
    let weatherIcon: String
    
    let columns = [
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        VStack {
            
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
     
        VStack {
            
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text(hour)
                        .font(.callout)
                        .foregroundStyle(Color.neutralText)
                        .fontWeight(.bold)
                    
                    Text(String(format: Constants.tempString, "\(temperature)"))
                        .font(.title)
                        .foregroundStyle(Color.accentColor)
                    
                    HStack {
                        Text(String(format: Constants.maxTempString, "\(maxTemperature)"))
                            .font(.caption)
                            .foregroundStyle(Color.neutralText)
                        
                        
                        Text(String(format: Constants.minTempString, "\(minTemperature)"))
                            .font(.caption)
                            .foregroundStyle(Color.neutralText)
                    }
                }
                
                Spacer()
                
                AsyncImage(url: URL(string: String(format: Constants.iconUrl, weatherIcon))) { image in
                    
                    image.image?.resizable()
                }
                .frame(width: Constants.iconHeight, height: Constants.iconHeight)
            }
            
            Divider().padding(Constants.padding)
            
            LazyVGrid(columns: columns, alignment: .leading, content: {
                
                ForecastItemView(imageName: "wind",
                                 description: "WIND",
                                 value: String(format: Constants.windDetailString, "\(windSpeed)"))
                
                ForecastItemView(imageName: "drop.degreesign",
                                 description: "PRECIPITATION",
                                 value: String(format: Constants.precipitationDetailString, "\(precipitation)", "%"))
                
                ForecastItemView(imageName: "thermometer",
                                 description: "FEELS LIKE",
                                 value: String(format: Constants.feelsTempDetailString, "\(feelsLikeTemperature)"))
                
                ForecastItemView(imageName: "eye",
                                 description: "VISIBILITY",
                                 value: String(format: Constants.visibilityDetailString, "\(visibility)"))
                
                ForecastItemView(imageName: "cloud",
                                 description: "CLOUDINESS",
                                 value: String(format: Constants.clouddinessDetailString, "\(clouddiness)", "%"))
                
                ForecastItemView(imageName: "humidity",
                                 description: "HUMIDITY",
                                 value: String(format: Constants.humidityDetailString, "\(humidity)", "%"))
            })
        }
    }
}

struct ForecastDetailCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { state in
                
            ForecastDetailCardView(hour: "15:00",
                                   temperature: 20,
                                   maxTemperature: 25,
                                   minTemperature: 18,
                                   windSpeed: 4,
                                   precipitation: 20,
                                   feelsLikeTemperature: 18,
                                   visibility: 500,
                                   clouddiness: 40,
                                   humidity: 0,
                                   weatherIcon: "04d")
        })
    }
}
