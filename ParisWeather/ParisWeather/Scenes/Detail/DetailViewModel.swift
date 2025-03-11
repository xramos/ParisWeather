//
//  DetailViewModel.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 4/7/24.
//

import Foundation
import Combine

protocol DetailViewModelContract {
    var slotsPublisher: AnyPublisher<[ForecastSlot], Never> { get }
}

class DetailViewModel {
    
    @Published var slots: [ForecastSlot] = []
    
    init(slots: [ForecastSlot]) {
        self.slots = slots
    }
}

extension DetailViewModel: DetailViewModelContract {
    
    var slotsPublisher: AnyPublisher<[ForecastSlot], Never> {
        $slots.eraseToAnyPublisher()
    }
}
