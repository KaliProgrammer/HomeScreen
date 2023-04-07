//
//  HomeRouter.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

protocol HomeRouting {
    
}

class HomeRouter {
    var viewController: UIViewController
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouting {
    
}
