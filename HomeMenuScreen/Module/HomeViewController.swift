//
//  HomeViewController.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit
import SnapKit

protocol HomeView: AnyObject {
    func updateDelivery(deliveryList: [DeliveryItemViewModel])
    func showSelected(category: CategoryType)
}

enum City {
    case Moscow
    case Kazan
    case Omsk
    
    var description: String {
        switch self {
        case .Moscow:
            return "Москва"
        case .Kazan:
            return "Казань"
        case .Omsk:
            return "Омск"
        }
    }
}

class HomeViewController: UIViewController {

    //MARK: - Custom layout for bannerCollection snapping
    
     enum Layout {
        static let customViewFullHeight: CGFloat = 302
        static let customViewSmallHeight: CGFloat = 160

        static let categoryTopOffset: CGFloat = 20
        static let bannerHeight: CGFloat = 120
    }

    var categoryTopConstraint: Constraint?
    var bannerHeightConstraint: Constraint?
    var presenter: HomePresentation?
    
    let backGroundcolor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
    
    var list: [String: [DeliveryItemViewModel]] = [:]

    let bannerArray: BannerCellModel = .init()
    let categoryArray: CategoryCellModel = .init()

    var customViewHeight: Constraint?

     lazy var bannerNavigationCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 112)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = backGroundcolor
        collection.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseIdentifier)
        return collection
    }()
    
     lazy var categoryNavigationCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 88, height: 32)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = backGroundcolor
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        return collection
    }()
    
     lazy var foodTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = backGroundcolor
        tableView.layer.cornerRadius = 16
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: FoodTableViewCell.reuseIdentifier)
        return tableView
    }()
    
     lazy var customView: UIView = {
        let customView = UIView()
        customView.backgroundColor = backGroundcolor
        return customView
    }()
    
     lazy var citylabel: UILabel = {
        let label = UILabel()
        label.text = City.Moscow.description
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
     lazy var chevronImage: UIImageView = {
        let chevron = UIImageView()
        let sfSymbol = UIImage(named: "Chevron")
        chevron.image = sfSymbol
        chevron.tintColor = .black
        return chevron
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backGroundcolor
        setupUI()
        bannerNavigationCollection.delegate = self
        bannerNavigationCollection.dataSource = self
        
        categoryNavigationCollection.delegate = self
        categoryNavigationCollection.dataSource = self
        
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        self.view.addSubview(customView)
        self.customView.addSubview(citylabel)
        self.customView.addSubview(chevronImage)
        self.customView.addSubview(bannerNavigationCollection)
        self.customView.addSubview(categoryNavigationCollection)
        self.view.addSubview(foodTableView)
        
        customView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            self.customViewHeight = make.height.equalTo(Layout.customViewFullHeight).constraint
        }
        
        citylabel.snp.makeConstraints { make in
            make.leading.equalTo(customView.snp.leading).offset(16)
            make.top.equalTo(customView.snp.top).offset(60)
            make.width.equalTo(61)
            make.height.equalTo(20)
        }
        
        chevronImage.snp.makeConstraints { make in
            make.leading.equalTo(citylabel.snp.trailing).offset(8)
            make.top.equalTo(customView.snp.top).offset(67)
            make.width.equalTo(14)
            make.height.equalTo(8)
        }
        
        bannerNavigationCollection.snp.makeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(104)
            make.leading.trailing.equalToSuperview()
            self.bannerHeightConstraint = make.height.equalTo(Layout.bannerHeight).constraint
        }
        
        categoryNavigationCollection.snp.makeConstraints { make in
            categoryTopConstraint = make.top.equalTo(bannerNavigationCollection.snp.bottom).offset(20).constraint
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        foodTableView.snp.makeConstraints { make in
            make.top.equalTo(self.customView.snp.bottom)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
            make.bottom.equalTo(self.view.snp.bottom)
        }
    }
}

