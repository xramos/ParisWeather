//
//  ForecastItemViewSnapshotTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 5/7/24.
//

import XCTest
import PreviewSnapshotsTesting

@testable import ParisWeather

final class ForecastItemViewSnapshotTests: XCTestCase {

    func test_snapshots() {
        
        ForecastItemView_Previews.snapshots.assertSnapshots(as:
                .image(precision: 0.98, perceptualPrecision: 0.98, layout: .device(config: .iPhoneX(.portrait)))
        )
    }
}
