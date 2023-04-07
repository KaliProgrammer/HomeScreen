//
//  ProfileModuleBuilder.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

//typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class ProfileModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory
    ) -> UIViewController {
        let view = ProfileViewController()
        return factory(view)
    }
}
