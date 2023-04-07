//
//  CartModuleBuilder.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

class CartModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory
    ) -> UIViewController {
        let view = CartViewController()
        return factory(view)
    }
}
