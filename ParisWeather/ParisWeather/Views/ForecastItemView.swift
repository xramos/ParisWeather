//
//  ForecastItemView.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 5/7/24.
//

import SwiftUI
import PreviewSnapshots

struct ForecastItemView: View {
    
    let imageName: String
    let description: String
    let value: String
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .center) {
                
                HStack {
                    
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14)
                    
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(Color.neutralText)
                }
                
                Text(value)
                    .font(.callout)
                    .foregroundStyle(Color.neutralText)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ForecastItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { state in
                
            ForecastItemView(imageName: "drop.degreesign",
                             description: "PRECICIPITATION",
                             value: "0%")
        })
    }
}
