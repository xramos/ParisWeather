//
//  HomeViewModel.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // Values
    
    @Published var slots1: [ForecastSlot] = []
    @Published var slots2: [ForecastSlot] = []
    @Published var slots3: [ForecastSlot] = []
    @Published var slots4: [ForecastSlot] = []
    @Published var slots5: [ForecastSlot] = []
    
    @Published var selectedSlots: [ForecastSlot] = []
    
    private var getForecastCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getForecast() {
        
        getForecastCancellable = GetForecastUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
                
            }, receiveValue: { (forecast: Forecast) in

                self.slots1 = self.getForecastSlot(list: forecast.list,
                                                   value: 0)
                
                self.slots2 = self.getForecastSlot(list: forecast.list,
                                                   value: 1)
                
                self.slots3 = self.getForecastSlot(list: forecast.list,
                                                   value: 2)
                
                self.slots4 = self.getForecastSlot(list: forecast.list,
                                                   value: 3)
                
                self.slots5 = self.getForecastSlot(list: forecast.list,
                                                   value: 4)
            })
    }
    
    func getForecastSlot(list: [ForecastSlot], value: Int) -> [ForecastSlot] {
        
        let date = Calendar.current.getSpecificDate(value: value)
        
        var dateSlots: [ForecastSlot] = []
        
        for slot in list {
            
            if let slotDate = slot.dateTime,
                Calendar.current.isSameDay(first: date, second: slotDate) {
                
                dateSlots.append(slot)
            }
        }
        
        return dateSlots
    }
}
