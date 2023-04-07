//
//  TabBarModuleBuilder.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

class TabBarModuleBuilder {
    static func build(usingSubModules submodules: TabBarRouter.SubModules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(usingSubModules: submodules)
        let tabBarController = DeliveryTabBarController(tabs: tabs)
        return tabBarController
    }
}

