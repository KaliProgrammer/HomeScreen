//
//  ProductCollectionCell.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class FoodTableViewCell: UITableViewCell {
    
    lazy var foodImageView: UIImageView = {
        let movieImage = UIImageView()
        movieImage.layer.masksToBounds = true
        return movieImage
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(red: 170/255, green: 170/255, blue: 173/255, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        label.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 6
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews([foodImageView,
                     titleLabel,
                     summaryLabel,
                     priceLabel])
        contentView.layer.masksToBounds = true
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func setupElements() {
        foodImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.width.height.equalTo(132)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(32)
            make.leading.equalTo(foodImageView.snp.trailing).offset(32)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
        
        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalTo(foodImageView.snp.trailing).offset(32)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.equalTo(18)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(summaryLabel.snp.bottom).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-24)
            make.height.equalTo(32)
            make.width.equalTo(87)
        }
    }
    
    private func addSubviews(_ subview: [UIView]) {
         for item in subview {
             contentView.addSubview(item)
         }
     }
    
    
    
    /// configure cell for foodTableView
    /// - Parameter viewModel: using data from json
    func configure(using viewModel: DeliveryItemViewModel?) {
        guard let viewModel else {
            return
        }
        self.titleLabel.text = viewModel.title
        self.foodImageView.sd_setImage(with: URL(string: viewModel.image))
        self.summaryLabel.text = viewModel.difficulty?.rawValue
        self.priceLabel.text = "от 345 р"
        self.selectionStyle = .none
    }
}
