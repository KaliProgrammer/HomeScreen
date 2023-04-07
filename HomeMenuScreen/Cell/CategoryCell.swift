//
//  CategoryCell.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            self.categoryLabel.backgroundColor = self.isSelected ? UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2) : UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            
            self.categoryLabel.font = self.isSelected ? UIFont.systemFont(ofSize: 13, weight: .semibold) : UIFont.systemFont(ofSize: 13)
            self.categoryLabel.textColor = self.isSelected ? UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1) : UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
            self.contentView.layer.borderWidth = self.isSelected ? 0 : 1
        }
    }
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
     func setupElements() {
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.layer.borderColor = CGColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
         contentView.layer.borderWidth = 1
         self.contentView.addSubview(categoryLabel)
         categoryLabel.snp.makeConstraints { make in
             make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func apply(viewModel: CategoryCellModel, indexPath: Int) {
        self.categoryLabel.text = viewModel.categories[indexPath].rawValue
    }
    
    
    func applySelectedLabel(background: UIColor, border: CGFloat, font: UIFont) {
        contentView.backgroundColor = background
        contentView.layer.borderWidth = border
        categoryLabel.font = font
    }
}
