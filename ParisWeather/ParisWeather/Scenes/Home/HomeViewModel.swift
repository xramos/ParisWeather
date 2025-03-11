//
//  HomeViewModel.swift
//  ParisWeather
//
//  Created by Xavier Ramos on 3/7/24.
//

import Foundation
import Combine

protocol HomeViewModelContract {
    var slots1Publisher: AnyPublisher<[ForecastSlot], Never> { get }
    var slots2Publisher: AnyPublisher<[ForecastSlot], Never> { get }
    var slots3Publisher: AnyPublisher<[ForecastSlot], Never> { get }
    var slots4Publisher: AnyPublisher<[ForecastSlot], Never> { get }
    var slots5Publisher: AnyPublisher<[ForecastSlot], Never> { get }
    
    func getForecast()
}

class HomeViewModel {

    let useCase: GetForecastUseCaseContract
    
    private var getForecastCancellable: AnyCancellable?
    
    @Published var slots1: [ForecastSlot] = []
    @Published var slots2: [ForecastSlot] = []
    @Published var slots3: [ForecastSlot] = []
    @Published var slots4: [ForecastSlot] = []
    @Published var slots5: [ForecastSlot] = []
    
    init(useCase: GetForecastUseCaseContract = GetForecastUseCase()) {
        
        self.useCase = useCase
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

extension HomeViewModel: HomeViewModelContract {
    
    var slots1Publisher: AnyPublisher<[ForecastSlot], Never> {
        $slots1.eraseToAnyPublisher()
    }
    
    var slots2Publisher: AnyPublisher<[ForecastSlot], Never> {
        $slots2.eraseToAnyPublisher()
    }
    
    var slots3Publisher: AnyPublisher<[ForecastSlot], Never> {
        $slots3.eraseToAnyPublisher()
    }
    
    var slots4Publisher: AnyPublisher<[ForecastSlot], Never> {
        $slots4.eraseToAnyPublisher()
    }
    
    var slots5Publisher: AnyPublisher<[ForecastSlot], Never> {
        $slots5.eraseToAnyPublisher()
    }
    
    func getForecast() {
        
        getForecastCancellable = useCase.execute()
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
}
