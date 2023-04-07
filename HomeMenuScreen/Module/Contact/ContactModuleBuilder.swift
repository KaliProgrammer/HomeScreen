//
//  ContactModuleBuilder.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

class ContactModuleBuilder {
    static func build(usingNavigationFactory factory: NavigationFactory
    ) -> UIViewController {
        let view = ProfileViewController()
        return factory(view)
    }
}
