//
//  FourthViewController.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 1.08.23.
//

import UIKit

class FourthViewController: UIViewController {
    
    private lazy var mosaicCollectionView: UICollectionView = {
        var mosaicCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
        mosaicCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mosaicCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return mosaicCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.mosaicCollectionView)
        self.mosaicCollectionView.dataSource = self
        
        NSLayoutConstraint.activate([
            self.mosaicCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.mosaicCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.mosaicCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.mosaicCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/2))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        
        let groupOfTwoSmallItemsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
        let groupOfTwoSmallItems = NSCollectionLayoutGroup.vertical(layoutSize: groupOfTwoSmallItemsSize, subitems: [smallItem])
        
        let twoThirdsItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1.0))
        let twoThirdsItem = NSCollectionLayoutItem(layoutSize: twoThirdsItemSize)
        
        let twoThirdsItemSizeGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/4))
        let twoThirdsItemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: twoThirdsItemSizeGroup, subitems: [groupOfTwoSmallItems, twoThirdsItem])
        
        let oneThirdsItemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: twoThirdsItemSizeGroup, subitems: [twoThirdsItem, groupOfTwoSmallItems])
        
        let fullWidthItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/4))
        let fullWidthItem = NSCollectionLayoutItem(layoutSize: fullWidthItemSize)
        
        let rootGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(400))
        let rootGroup = NSCollectionLayoutGroup.vertical(layoutSize: rootGroupSize, subitems: [twoThirdsItemGroup, fullWidthItem, oneThirdsItemGroup, fullWidthItem])
        rootGroup.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let section = NSCollectionLayoutSection(group: rootGroup)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension FourthViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return CollectionViewCell() }
        cell.congigureCell(row: indexPath.row)
        return cell
    }
}
