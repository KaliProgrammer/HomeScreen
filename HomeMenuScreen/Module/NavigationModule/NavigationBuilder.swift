//
//  NavigationBuilder.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
   static func build(rootView: UIViewController) -> UINavigationController {
              
        let navigationController = UINavigationController(rootViewController: rootView)
       
       //MARK: - Removing Navigation Bar

       navigationController.navigationBar.layer.zPosition = -1
       
       if #available(iOS 15.0, *) {
           
           let navigationBarAppearance = UINavigationBarAppearance()
           navigationBarAppearance.configureWithOpaqueBackground()
           UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
       }
        return navigationController
    }
}

