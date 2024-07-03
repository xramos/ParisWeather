//
//  NetworkError.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
