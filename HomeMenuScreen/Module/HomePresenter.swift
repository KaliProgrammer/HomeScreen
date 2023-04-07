//
//  HomePresenter.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
    func select(category: CategoryType)
}

class HomePresenter {
    weak var view: HomeView?
    var interactor: HomeUseCase?
    var router: HomeRouting?
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresentation {
    
    func viewDidLoad() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor?.getDelivery(completion: { (result) in
                let deliveryList = result.compactMap { DeliveryItemViewModel(using: $0)}
                DispatchQueue.main.async {
                    self?.view?.updateDelivery(deliveryList: deliveryList)
                }
            })
        }
    }

    func select(category: CategoryType) {
        view?.showSelected(category: category)
    }
}
