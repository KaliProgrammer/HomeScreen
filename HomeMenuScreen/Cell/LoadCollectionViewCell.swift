//
//  LoadCollectionViewCell.swift
//  HomeMenuScreen
//
//  Created by MacBook Air on 03.04.2023.
//

import Foundation
import UIKit

final class LoadCollectionViewCell: UICollectionViewCell {
    private lazy var loaderView: UIActivityIndicatorView = {
        let loaderView = UIActivityIndicatorView(style: .large)
        loaderView.color = .black
        return loaderView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI() {
        contentView.addSubview(loaderView)
        loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        loaderView.startAnimating()
    }
}
