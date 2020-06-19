//
//  MenuItemCell.swift
//  showcase-ios
//
//  Created by Brenda Lau on 18/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    static let reuseIdentifier: String = "MenuItemCell"

    // MARK: - Variables
    private var titleLabel = UILabel()
    private var lineView = UIView()

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    // MARK: - Configure and Reuse
    func configure(with menuItem: MenuItem) {
        self.titleLabel.text = menuItem.title
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = "-"
    }
}

extension MenuItemCell {
    private func configureHierarchy() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.fitToSuperview(padding: 20)

        lineView.backgroundColor = .systemGray
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        contentView.addSubview(lineView)
    }
}
