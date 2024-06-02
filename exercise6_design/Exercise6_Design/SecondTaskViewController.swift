//
//  SecondTaskViewController.swift
//  Exercise6_Design
//
//  Created by Karina Kovaleva on 19.07.23.
//

import UIKit

class SecondTaskViewController: UIViewController {

    private let sideImageView: CGFloat = 300
    private let margin: CGFloat = 16

    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView ()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerStackView: UIStackView = {
        var containerStackView = UIStackView()
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .horizontal
        return containerStackView
    }()
    
    private lazy var stackViewForButtons: UIStackView = {
        var stackViewForButtons = UIStackView()
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewForButtons.axis = .horizontal
        stackViewForButtons.distribution = .fill
        stackViewForButtons.spacing = self.margin
        return stackViewForButtons
    }()
    
    private lazy var configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.tinted()
        configuration.buttonSize = .medium
        configuration.baseBackgroundColor = .systemMint
        return configuration
    }()
    
    private lazy var removeButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Remove"
        
        var removeButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.configuration = configuration
        
        removeButton.addTarget(self, action: #selector(self.removeImageView), for: .touchUpInside)
        return removeButton
    }()
    
    private lazy var addButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Add"
        
        var addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.configuration = configuration
        
        addButton.addTarget(self, action: #selector(self.addImageView), for: .touchUpInside)
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.containerStackView)

        self.setupStackViewForButtons()
        self.setupLayout()
    }
    
    private func setupStackViewForButtons() {
        self.view.addSubview(self.stackViewForButtons)
        let buttons = [self.removeButton, self.addButton]
        buttons.forEach { self.stackViewForButtons.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.stackViewForButtons.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin),
            self.stackViewForButtons.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -self.margin),
            self.stackViewForButtons.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -self.margin),
            
            self.scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.heightAnchor.constraint(equalToConstant: self.sideImageView),

            self.containerStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.containerStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.containerStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.containerStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.containerStackView.heightAnchor.constraint(equalToConstant: self.sideImageView),
        ])
    }
    
    @objc func addImageView(sender: UIButton) -> Void {
        let squareImageView = UIImageView(image: UIImage(named: "cat"))
        squareImageView.translatesAutoresizingMaskIntoConstraints = false
        squareImageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            squareImageView.widthAnchor.constraint(equalToConstant: self.sideImageView),
            squareImageView.widthAnchor.constraint(equalToConstant: self.sideImageView)
        ])
        
        self.containerStackView.addArrangedSubview(squareImageView)
    }
    
    @objc func removeImageView(sender: UIButton) -> Void {
        self.containerStackView.arrangedSubviews.last?.removeFromSuperview()
    }
}

