//
//  ReuseIdentifiable.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

// MARK: - ReuseIdentifier for all cell in app

protocol ReuseIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReuseIdentifiable {}
