//
//  DeliveryTabBarController.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

typealias DeliveryTabs = (
    menu: UIViewController,
    contact: UIViewController,
    profile: UIViewController,
    cart: UIViewController
)

class DeliveryTabBarController: UITabBarController {
    
    init(tabs: DeliveryTabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.menu, tabs.contact, tabs.profile, tabs.cart]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .white
   UITabBar.appearance().tintColor = UIColor(cgColor: CGColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1))
   
        UITabBar.appearance().isTranslucent = true
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
    
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}
