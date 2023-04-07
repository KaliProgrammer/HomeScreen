//
//  HomeViewController+Extensions.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 04.04.2023.
//

import Foundation
import UIKit
import SnapKit


extension HomeViewController: HomeView, UITableViewDelegate, UITableViewDataSource {
    
    /// //Function for filter
    /// - Parameter deliveryList: here we take 2 cases for filter in categoryCollectionView
    func updateDelivery(deliveryList: [DeliveryItemViewModel]) {
        var easy: [DeliveryItemViewModel] = []
        var medium: [DeliveryItemViewModel] = []
        deliveryList.forEach {
            switch $0.difficulty {
            case .easy:
                easy.append($0)
            case .medium:
                medium.append($0)
            default:
                return
            }
        }
        self.list = ["Easy": easy, "Medium": medium]
        DispatchQueue.main.async {
            self.foodTableView.reloadData()
        }
        print("Grocery list: \(deliveryList)")
    }

    func showSelected(category: CategoryType) {
        guard let index = categoryArray.categories.firstIndex(of: category) else {
            return
        }
        foodTableView.scrollToRow(at: IndexPath(item: 0, section: index), at: .top, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return list.keys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = categoryArray.categories[section]
        return list[category.rawValue]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.reuseIdentifier, for: indexPath) as? FoodTableViewCell else {
            return UITableViewCell()
        }
        let category = categoryArray.categories[indexPath.section]
        let newViewModel = list[category.rawValue]?[indexPath.row]
        
        cell.configure(using: newViewModel)
        return cell
    }
    
    //MARK: - BannerCollection snapping
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let swipingDown = y <= 0
        let shouldSnap = y > 30
        
        UIView.animate(withDuration: 0.3) {
            self.bannerNavigationCollection.alpha = swipingDown ? 1.0 : 0.0
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {

                let customViewHeight = shouldSnap ? Layout.customViewSmallHeight : Layout.customViewFullHeight
                self.customViewHeight?.update(offset: customViewHeight)
                let bannerHeight = shouldSnap ? 0 : Layout.bannerHeight
                self.bannerHeightConstraint?.update(offset: bannerHeight)
                let categoryOffset = shouldSnap ? 0 : Layout.categoryTopOffset
                self.categoryTopConstraint?.update(offset: categoryOffset)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case bannerNavigationCollection:
           return bannerArray.imagesForBanner.count
        case categoryNavigationCollection:
            return categoryArray.categories.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case bannerNavigationCollection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseIdentifier, for: indexPath) as? BannerCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .white
            let viewModel = bannerArray
            cell.apply(bannerImage: viewModel, indexPath: indexPath.row)
            cell.layer.cornerRadius = 10
            return cell
            
        case categoryNavigationCollection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            cell.layer.cornerRadius = 16
            let viewModel = categoryArray
            cell.apply(viewModel: viewModel, indexPath: indexPath.row)

            return cell

        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryNavigationCollection:
            if indexPath.row < 2 {
                let category = categoryArray.categories[indexPath.row]
                presenter?.select(category: category)
            }
        default:
            break
        }
    }
}
