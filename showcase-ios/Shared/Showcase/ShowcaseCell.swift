//
//  ShowcaseCell.swift
//  showcase-ios
//
//  Created by Brenda Lau on 19/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

class ShowcaseCell: UICollectionViewCell {
    static let reuseIdentifier: String = "ShowcaseCell"

    // MARK: - Variables
    private var imageView = UIImageView()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = self.bounds
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    // MARK: - Configure and Reuse
    func configure(with showcase: Showcase) {
        imageView.image = UIImage(named: showcase.photoName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}

extension ShowcaseCell {
    private func configureHierarchy() {
        imageView.fitToSuperview()
        contentView.addSubview(imageView)
    }
}
