//
//  HomeInteractor.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation

protocol HomeUseCase {
    func getDelivery(completion: @escaping DeliveryClosure)
}

class HomeInteractor {
    var service: DeliveryAPI
    
    init(service: DeliveryAPI) {
        self.service = service
    }
}

extension HomeInteractor: HomeUseCase {
    func getDelivery(completion: @escaping DeliveryClosure) {
        service.fetchDelivery { (result) in
            completion(result)
        }
    }
}
