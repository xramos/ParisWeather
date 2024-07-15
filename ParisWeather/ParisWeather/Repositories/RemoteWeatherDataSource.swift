//
//  RemoteWeatherDataSource.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

class RemoteWeatherDataSource {
    
    // URLs
    static let forecast_UrlPath: String = "data/2.5/forecast"
    
    // Variables
    
    private let baseURLString: String
    private let session: URLSession
    
    // MARK: - Methods
    
    init(baseURLString: String? = nil, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURLString ?? Constants.baseURL
        self.session = session
    }
    
    func getForecast() -> AnyPublisher<ServerForecast, Error> {
        
        let networkManger = NetworkManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getForecastEndpoint()
        
        return networkManger.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemoteWeatherDataSource {
 
    func getForecastEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)/\(RemoteWeatherDataSource.forecast_UrlPath)"
        
        var components = URLComponents(string: endpoint)
        
        let queryItems = [URLQueryItem(name: "q", value: "Paris,FR"),
                          URLQueryItem(name: "units", value: "metric"),
                          URLQueryItem(name: "mode", value: "json"),
                          URLQueryItem(name: "appid", value: Constants.apiKey)]
        
        components?.queryItems = queryItems
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
