//
//  WeatherRepositoryImplementationUnitTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest
import Combine

@testable import ParisWeather

final class WeatherRepositoryImplementationUnitTests: XCTestCase {

    var sut: WeatherRepositoryImplementation?
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
}

// MARK: - Get Forecast

extension WeatherRepositoryImplementationUnitTests {
    
    func testGetForecastOK() {
        
        // Given
        let session = getForecastSession(statusCode: successStatusCode)
        
        let remote = RemoteWeatherDataSource(baseURLString: baseUrlString,
                                             session: session)
        
        sut = WeatherRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected forecast")
        
        // When
        cancellable = sut!.getForecast()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
            },
                  receiveValue: { _ in })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetForecastKO() {
        
        // Given
        let session = getForecastSession(statusCode: failureStatusCode)
        
        let remote = RemoteWeatherDataSource(baseURLString: baseUrlString,
                                             session: session)
        
        sut = WeatherRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected forecast")
        
        // When
        cancellable = sut!.getForecast()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, 
                  receiveValue: { _ in})
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

// MARK: - Session

fileprivate extension WeatherRepositoryImplementationUnitTests {
    
    func getForecastSession(statusCode: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "\(baseUrlString)/data/2.5/forecast?q=Paris,FR&units=metric&mode=json&appid=\(Constants.apiKey)")
        
        // data we expect to receive
        let data = getForecastData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getForecastData() -> Data {
        
        let dataString = """
                                    {
                                        "list": []
                                    }
                        """
        
        return Data(dataString.utf8)
    }
}
