# ParisWeather
Paris Weather forecast

Technology used:
- XCode 15.0.1
- Combine
- SwiftUI

Libraries Added:
- snapshot testing (https://github.com/pointfreeco/swift-snapshot-testing)

Decisions:
- Use of Combine instead of RxSwift as is a newer technology more integrated with SwiftUI

Things to improve:
- Add swiftlint

# vpTech iOS Coding Challenge: Weather App
## Objective

Develop a universal iOS application (iPhone/iPad) showcasing adept use of reactive programming principles with RxSwift. The app will provide a 5-day weather forecast for Paris, featuring both a summary and a detailed view for each day.

## Design Inspiration

Your app's UI/UX should draw inspiration from the veepee application. Strive for a clean, intuitive design that enhances user experience.

## Weather API

Utilize the OpenWeatherMap API to fetch weather data:

Main API: 
http://openweathermap.org/api

5-Day Forecast: 
http://openweathermap.org/forecast5#name5

Weather Conditions and Icons: 
http://openweathermap.org/weather-conditions

## App Features

Home Screen: 
Display a 5-day weather forecast for Paris. Each day should provide a summary view (e.g., overall weather, high/low temperatures).

Detail View: 
Upon selecting a day, present a detailed forecast for Paris. This could include hourly forecasts, wind speed, humidity, and other relevant data.

## Requirements

Swift 5: 
The application must be written in Swift 5, utilizing the latest iOS SDKs.

RxSwift: 
Emphasize the use of RxSwift for all networking calls, data bindings, and UI events. Demonstrate effective use of observables, subjects, and the reactive pattern to create a responsive and user-friendly app.

External Libraries: 
The use of external frameworks besides RxSwift is permitted, but please justify their inclusion. Preference will be given to solutions that make thoughtful and efficient use of additional libraries.

Architecture: 
While the choice of architectural pattern (e.g., MVC, MVVM, VIPER) is up to you, your application's architecture should facilitate clean, maintainable code. Incorporating reactive programming principles into your architectural decisions is crucial.

Code Quality: 
Attention to detail, adherence to iOS development best practices, and code readability will be key evaluation criteria.
