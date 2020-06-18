//
//  MenuViewController.swift
//  showcase-ios
//
//  Created by Brenda Lau on 18/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    enum Section: CaseIterable {
        case main
    }

    // MARK: - Variables
    private var dataSource: UICollectionViewDiffableDataSource<Section, MenuItem>?
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    // MARK: - View Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
        self.setItems(with: MenuItem.sampleData())
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.updateLayout()
    }

    // MARK: - Configure Functions
    private func configureHierarchy() {
        collectionView.frame = self.view.frame
        collectionView.backgroundColor = .white
        self.view.addSubview(self.collectionView)
        collectionView.fitToSuperview(padding: 0)

        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: MenuItemCell.reuseIdentifier)
        collectionView.delegate = self
        self.updateLayout()
    }

    private func updateLayout() {
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical

            let sectionInset = layout.sectionInset
            layout.itemSize = CGSize(
                width: UIScreen.main.bounds.width - sectionInset.left - sectionInset.right,
                height: 100
            )
        }
    }
}

// MARK: - DiffableDataSource
extension MenuViewController {
    func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Section, MenuItem>(collectionView: self.collectionView) { (collectionView, indexPath, menuItem) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCell.reuseIdentifier, for: indexPath) as? MenuItemCell else {
                fatalError("MenuItemCell was not configured")
            }
            cell.configure(with: menuItem)
            return cell
        }
    }

    func setItems(with items: [MenuItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MenuItem>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(items)
        self.dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: select item
    }
}
