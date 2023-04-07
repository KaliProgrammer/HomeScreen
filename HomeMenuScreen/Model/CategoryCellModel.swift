//
//  CategoryCellModel.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation

enum CategoryType: String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case salad = "Salad"
    case dessert = "Dessert"
//    case undefined = "Undefined"
}

struct CategoryCellModel {
    let categories: [CategoryType] = CategoryType.allCases
}
