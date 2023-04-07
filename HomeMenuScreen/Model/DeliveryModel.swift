//
//  DeliveryModel.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation

struct DeliveryResult: Codable {
    let delivery: [DeliveryElement]
}

// MARK: - DeliveryElement
struct DeliveryElement: Codable {
    let id, title: String?
    let difficulty: Difficulty?
    let image: String?
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
}

typealias Delivery = [DeliveryElement]

