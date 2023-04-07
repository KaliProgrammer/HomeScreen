//
//  TabBarRouter.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

class TabBarRouter {
    var viewController: UIViewController
    
    typealias SubModules = (
        menu: UIViewController,
        contact: UIViewController,
        profile: UIViewController,
        cart: UIViewController
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension TabBarRouter {
    static func tabs(usingSubModules subModules: SubModules) -> DeliveryTabs {
        let menuTabBarItem = UITabBarItem(title: "Меню", image: UIImage(named: "Menu"), tag: 11)
        let contactTabBarItem = UITabBarItem(title: "Контакты", image: UIImage(named: "ContactTabBarItem"), tag: 11)
        let profileTabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "Profile"), tag: 11)
        let cartTabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "Cart"), tag: 11)
        
        subModules.menu.tabBarItem = menuTabBarItem
        subModules.contact.tabBarItem = contactTabBarItem
        subModules.profile.tabBarItem = profileTabBarItem
        subModules.cart.tabBarItem = cartTabBarItem
        
        return (
            menu: subModules.menu,
            contact: subModules.contact,
            profile: subModules.profile,
            cart: subModules.cart
        )
    }
}
