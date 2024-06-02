//
//  ProfileView.swift
//  Exercise5_Design
//
//  Created by Karina Kovaleva on 18.07.23.
//

import UIKit

class ProfileView: UIView {

    private let font = "Helvetica Neue"
    private let margin: CGFloat = 20
    private let eyeImageView = UIImageView(image: UIImage(systemName: "eye.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
    private let commentImageView = UIImageView(image: UIImage(systemName: "message.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
    private let heartImageView = UIImageView(image: UIImage(systemName: "heart.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))

    private lazy var backButton: UIButton = {
        var backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "arrow.left")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        return backButton
    }()
    
    private lazy var detailsButton: UIButton = {
        var detailsButton = UIButton()
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.setImage(UIImage(systemName: "ellipsis")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        return detailsButton
    }()
    
    private lazy var mainImageView: UIImageView = {
        var mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.contentMode = .scaleAspectFill
        return mainImageView
    }()
    
    private lazy var newsLabel: UILabel = {
        var newsLabel = UILabel()
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.font = UIFont(name: font, size: 25)
        newsLabel.numberOfLines = 0
        return newsLabel
    }()
    
    private lazy var profileStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleToFill
        return avatarImageView
    }()
    
    private lazy var stackViewForNameAndStatusLabels: UIStackView = {
        var stackViewForNameAndStatusLabels = UIStackView()
        stackViewForNameAndStatusLabels.axis = .vertical
        return stackViewForNameAndStatusLabels
    }()

    private lazy var nameLabel: UILabel = {
        var nameLabel = UILabel()
        return nameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        var statusLabel = UILabel()
        return statusLabel
    }()

    private lazy var followButton: UIButton = {
        var followButton = UIButton()
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.setTitle("+ Follow", for: .normal)
        followButton.backgroundColor = .systemOrange
        followButton.layer.cornerRadius = 10
        return followButton
    }()
    
    private lazy var recommendedStackView: UIStackView = {
        var recommendedStackView = UIStackView()
        recommendedStackView.translatesAutoresizingMaskIntoConstraints = false
        recommendedStackView.axis = .horizontal
        return recommendedStackView
    }()
    
    private lazy var recommendedPeopleLabel: UILabel = {
        var recommendedPeopleLabel = UILabel()
        recommendedPeopleLabel.textAlignment = .right
        return recommendedPeopleLabel
    }()
    
    private lazy var recommendedByLabel: UILabel = {
        var recommendedLabel = UILabel()
        recommendedLabel.text = "Recommended by:"
        return recommendedLabel
    }()
    
    private lazy var followersIconsStackView: UIStackView = {
        var followersIconsStackView = UIStackView ()
        followersIconsStackView.translatesAutoresizingMaskIntoConstraints = false
        followersIconsStackView.axis = .horizontal
        followersIconsStackView.spacing = -6
        followersIconsStackView.distribution = .fillEqually
        return followersIconsStackView
    }()
    
    private lazy var profileStatisticsStackView: UIStackView = {
        var profileStatisticsStackView = UIStackView ()
        profileStatisticsStackView.translatesAutoresizingMaskIntoConstraints = false
        profileStatisticsStackView.axis = .horizontal
        profileStatisticsStackView.distribution = .fillProportionally
        profileStatisticsStackView.spacing = 3
        return profileStatisticsStackView
    }()
    
    private lazy var numberOfProfileViewsLabel: UILabel = {
        var numberOfProfileViewsLabel = UILabel ()
        return numberOfProfileViewsLabel
    }()
    
    private lazy var numberOfCommentsLabel: UILabel = {
        var numberOfCommentsLabel = UILabel ()
        return numberOfCommentsLabel
    }()
    
    private lazy var numberOfLikesLabel: UILabel = {
        var numberOfLikesLabel = UILabel ()
        return numberOfLikesLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.setupView()
        self.setupLayout()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.height / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let nameAndStatusLabels = [self.nameLabel, self.statusLabel]
        let itemsForRecommendedStackView = [self.recommendedByLabel, self.recommendedPeopleLabel]
        let itemsForProfileStackView = [self.avatarImageView, self.stackViewForNameAndStatusLabels, self.followButton]
        let itemsForProfileStatisticsStackView = [self.eyeImageView, self.numberOfProfileViewsLabel, self.commentImageView, self.numberOfCommentsLabel, self.heartImageView, self.numberOfLikesLabel]
        
        self.addSubview(self.mainImageView)
        self.addSubview(self.backButton)
        self.addSubview(self.detailsButton)
        self.addSubview(self.newsLabel)
        self.addSubview(self.profileStackView)
        self.addSubview(self.recommendedStackView)
        self.addSubview(self.followersIconsStackView)
        self.addSubview(self.profileStatisticsStackView)
        
        nameAndStatusLabels.forEach { self.stackViewForNameAndStatusLabels.addArrangedSubview($0) }
        itemsForRecommendedStackView.forEach { self.recommendedStackView.addArrangedSubview($0) }
        itemsForProfileStackView.forEach { self.profileStackView.addArrangedSubview($0) }
        itemsForProfileStatisticsStackView.forEach { self.profileStatisticsStackView.addArrangedSubview($0) }
        
        for _ in 1...5 {
            let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
            self.followersIconsStackView.addArrangedSubview(imageView)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mainImageView.bottomAnchor.constraint(equalTo: self.profileStackView.topAnchor, constant: -margin * 3),
            
            self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.margin * 2),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            
            self.detailsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: self.margin * 2),
            self.detailsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin),
            
            self.profileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.margin),
            self.profileStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.margin),
            self.profileStackView.bottomAnchor.constraint(equalTo: self.recommendedStackView.topAnchor, constant: -margin * 2),
            
            self.avatarImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/7),
            self.avatarImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/7),
            
            self.followButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            self.followButton.heightAnchor.constraint(equalTo: self.profileStackView.heightAnchor, multiplier: 2/4),
            
            self.newsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.margin),
            self.newsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.margin * 4),
            self.newsLabel.bottomAnchor.constraint(equalTo: self.profileStackView.topAnchor, constant: -self.margin),
            
            self.recommendedStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.margin),
            self.recommendedStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.margin),
            
            self.followersIconsStackView.topAnchor.constraint(equalTo: self.recommendedStackView.bottomAnchor, constant: self.margin),
            self.followersIconsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.margin),
            self.followersIconsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -self.margin),
            
            self.profileStatisticsStackView.topAnchor.constraint(equalTo: self.recommendedStackView.bottomAnchor, constant: self.margin),
            self.profileStatisticsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.margin),
        ])
        self.recommendedByLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    public func createView(user: User) {
        self.mainImageView.image = UIImage(named: user.mainImage)
        self.newsLabel.text = user.newsText
        self.avatarImageView.image = UIImage(named: user.avatarImage)
        self.nameLabel.text = user.name
        self.statusLabel.text = "\(user.status) day ago"
        self.recommendedPeopleLabel.text = "\(user.recommendedUsers)/\(user.allUsers) users"
        self.numberOfProfileViewsLabel.text = "\(user.numberOfViews)"
        self.numberOfCommentsLabel.text = "\(user.numberOfComments)"
        self.numberOfLikesLabel.text = "\(user.numberOfLikes)"
    }
}
