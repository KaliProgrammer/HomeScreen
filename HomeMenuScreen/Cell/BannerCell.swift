//
//  BannerCell.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {
    
    lazy var bannerImageView: UIImageView = {
        let bannerImage = UIImageView()
        bannerImage.layer.cornerRadius = 10
        bannerImage.layer.masksToBounds = true
        bannerImage.contentMode = .scaleAspectFill
        return bannerImage
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
        contentView.layer.cornerRadius = 10
         self.contentView.addSubview(bannerImageView)
         
         bannerImageView.snp.makeConstraints { make in
             make.top.equalTo(contentView.snp.top)
             make.leading.equalTo(contentView.snp.leading)
             make.height.equalTo(112)
             make.width.equalTo(300)
        }
    }
    
    func apply(bannerImage: BannerCellModel, indexPath: Int) {
        bannerImageView.image = UIImage(named: bannerImage.imagesForBanner[indexPath])
    }
}
