//
//  ThirdLineTableViewCell.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 2.08.23.
//

import UIKit

class ThreeLineTableViewCell: UITableViewCell {
    
    static let identifier = "ThreeLineTableViewCell"
    private let margin: CGFloat = 16
    private let font = "Helvetica Neue"
    private let basicLetterSize: CGFloat = 15
    private let descriptionLetterSize: CGFloat = 13
    
    private lazy var mainStackView: UIStackView = {
        var mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .horizontal
        mainStackView.spacing = margin
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .center
        return mainStackView
    }()
    
    private lazy var squareImageView: UIImageView = {
        var squareImageView = UIImageView()
        squareImageView.translatesAutoresizingMaskIntoConstraints = false
        return squareImageView
    }()
    
    private lazy var stackViewForLabels: UIStackView = {
        var stackViewForLabels = UIStackView()
        stackViewForLabels.translatesAutoresizingMaskIntoConstraints = false
        stackViewForLabels.axis = .vertical
        [self.nameAndSurnameLabel, self.ageLabel, self.descriptionLabel].forEach { stackViewForLabels.addArrangedSubview($0) }
        stackViewForLabels.distribution = .fill
        return stackViewForLabels
    }()
    
    private lazy var nameAndSurnameLabel: UILabel = {
        var nameAndSurnameLabel = UILabel()
        nameAndSurnameLabel.font = UIFont(name: self.font, size: self.basicLetterSize)
        return nameAndSurnameLabel
    }()
    
    private lazy var ageLabel: UILabel = {
        var ageLabel = UILabel()
        ageLabel.font = UIFont(name: self.font, size: self.descriptionLetterSize)
        return ageLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: self.font, size: self.descriptionLetterSize)
        return descriptionLabel
    }()
    
    private lazy var sexLabel: UILabel = {
        var sexLabel = UILabel()
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.layer.borderColor = UIColor.systemGray.cgColor
        sexLabel.layer.borderWidth = 1
        sexLabel.textAlignment = .center
        return sexLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMainStackView()
        self.descriptionLabel.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupMainStackView() {
        self.contentView.addSubview(self.mainStackView)
        
        self.mainStackView.addArrangedSubview(self.squareImageView)
        self.mainStackView.addArrangedSubview(self.stackViewForLabels)
        self.mainStackView.addArrangedSubview(self.sexLabel)
        
        NSLayoutConstraint.activate([
            self.mainStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: margin),
            self.mainStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: margin),
            self.mainStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -margin),
            self.mainStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -margin),
            
            self.sexLabel.widthAnchor.constraint(equalToConstant: 24),
            
            self.squareImageView.widthAnchor.constraint(equalToConstant: 40),
            self.squareImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    public func configureCell(model: User) {
        UIImage.loadFrom(url: model.squareAvatarURL, completion: { image in
            self.squareImageView.image = image
        })
        self.nameAndSurnameLabel.text = model.firstName + " " + model.lastName
        self.ageLabel.text = "Age: \(model.age)"
        self.descriptionLabel.text = model.description
        
        switch model.sex {
        case .male:
            self.sexLabel.text = "M"
        case .female:
            self.sexLabel.text = "F"
        }
    }
}
