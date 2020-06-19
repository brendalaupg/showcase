//
//  FlowLayoutViewController.swift
//  showcase-ios
//
//  Created by Brenda Lau on 19/06/2020.
//  Copyright © 2020 Brenda Lau. All rights reserved.
//

import UIKit

class FlowLayoutViewController: UIViewController {
    // MARK: - Variables
    private var dataSource: UICollectionViewDiffableDataSource<Section, Showcase>?
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    private let layout: UICollectionViewFlowLayout

    // MARK: - Initialization
    init(collectionViewLayout: UICollectionViewFlowLayout) {
        self.layout = collectionViewLayout
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureDataSource()
        setItems(with: Showcase.sampleData())
    }

    // MARK: - Configure Functions
    private func configureHierarchy() {
        collectionView.frame = self.view.frame
        collectionView.backgroundColor = .white
        self.view.addSubview(self.collectionView)
        collectionView.fitToSuperview()
        collectionView.delegate = self

        collectionView.register(ShowcaseCell.self, forCellWithReuseIdentifier: ShowcaseCell.reuseIdentifier)
        self.updateLayout()
    }

    private func updateLayout() {
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        }
    }
}

// MARK: - DiffableDataSource
extension FlowLayoutViewController {
    func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Section, Showcase>(collectionView: self.collectionView) { collectionView, indexPath, showcase -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowcaseCell.reuseIdentifier, for: indexPath) as? ShowcaseCell else {
                fatalError("ShowcaseCell was not configured")
            }
            cell.configure(with: showcase)
            return cell
        }
    }

    func setItems(with items: [Showcase]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Showcase>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(items)
        self.dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FlowLayoutViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
    }
}
