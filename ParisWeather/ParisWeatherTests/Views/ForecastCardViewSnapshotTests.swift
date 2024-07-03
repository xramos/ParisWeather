//
//  ForecastCardViewSnapshotTests.swift
//  ParisWeatherTests
//
//  Created by Xavier Ramos on 3/7/24.
//

import XCTest
import PreviewSnapshotsTesting

@testable import ParisWeather

final class ForecastCardViewSnapshotTests: XCTestCase {

    func test_snapshots() {
        
        ForecastCardView_Previews.snapshots.assertSnapshots(as:
                .image(precision: 0.98, perceptualPrecision: 0.98, layout: .device(config: .iPhoneX(.portrait)))
        )
    }
}
