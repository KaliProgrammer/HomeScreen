//
//  DeliveryItemViewModel.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation

struct DeliveryItemViewModel {
    let image: String
    let title: String
    let difficulty: Difficulty?
    
    init(using deliveryModel: DeliveryElement) {
        self.image = deliveryModel.image ?? ""
        self.title = deliveryModel.title ?? ""
        self.difficulty = deliveryModel.difficulty
    }
}
