//
//  HomeModuleBuilder.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

class HomeModuleBuilder {
    
    static func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let interactor = HomeInteractor(service: HTTPService.shared)
        let view = HomeViewController()
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return factory(view)
    }

}
