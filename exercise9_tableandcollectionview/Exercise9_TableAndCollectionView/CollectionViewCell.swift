//
//  CollectionViewCell.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 3.08.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    private let titles = ["MY DOCTOR", "MY CAREMANAGER", "MY DIAGNOSIS", "THERAPY PLAN", "REMAINING PILLS", "MY ORDERS"]
    private let colors: [UIColor] = [.systemTeal, .systemPurple, .systemCyan, .systemGray, .systemMint, .systemIndigo]
    private let images = [UIImage(systemName: "pill"),
                          UIImage(systemName: "cross.case"),
                          UIImage(systemName: "staroflife"),
                          UIImage(systemName: "cross.vial"),
                          UIImage(systemName: "ivfluid.bag"),
                          UIImage(systemName: "facemask")
    ]
    
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0.3
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Arial Bold", size: 10)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
    }

    public func congigureCell(row: Int) {
        self.contentView.backgroundColor = self.colors[row % colors.count]
        self.imageView.image = self.images[row % images.count]
        self.titleLabel.text = self.titles[row % titles.count]
    }
}
