//
//  ViewController.swift
//  Exercise7_Design
//
//  Created by Karina Kovaleva on 19.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    private let margin: CGFloat = 16
    private let sideView: CGFloat = 100
    private let colors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemGray, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemGreen, .systemIndigo]
    private var currentIndexColor = 0
    
    private lazy var squareView: UIView = {
        var squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = self.colors[self.currentIndexColor]
        return squareView
    }()
    
    private lazy var stackViewForButtons: UIStackView = {
        var stackViewForButtons = UIStackView()
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewForButtons.axis = .horizontal
        stackViewForButtons.distribution = .fillEqually
        return stackViewForButtons
    }()
    
    private lazy var colorLabel: UILabel = {
        var colorLabel = UILabel()
        colorLabel.text = String(self.currentIndexColor)
        colorLabel.textAlignment = .center
        return colorLabel
    }()
    
    private lazy var configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.tinted()
        configuration.baseBackgroundColor = .systemMint
        return configuration
    }()
    
    private lazy var previousButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Previous"
        
        var previousButton = UIButton()
        previousButton.configuration = configuration
        previousButton.addTarget(self, action: #selector(self.showPreviousColor), for: .touchUpInside)
        return previousButton
    }()
    
    private lazy var nextButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Next"
        
        var nextButton = UIButton()
        nextButton.configuration = configuration
        nextButton.addTarget(self, action: #selector(self.showNextColor), for: .touchUpInside)
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.squareView)
        self.setupStackView()
        self.setupLayout()
    }
    
    private func setupStackView() {
        self.view.addSubview(self.stackViewForButtons)
        
        let itemsForStackView = [previousButton, colorLabel, nextButton]
        itemsForStackView.forEach { self.stackViewForButtons.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.squareView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.squareView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.squareView.widthAnchor.constraint(equalToConstant: self.sideView),
            self.squareView.heightAnchor.constraint(equalToConstant: self.sideView),
            
            self.stackViewForButtons.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin),
            self.stackViewForButtons.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -self.margin),
            self.stackViewForButtons.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -self.margin)
        ])
    }
    
    @objc private func showPreviousColor() {
        if self.currentIndexColor != 0 {
            self.currentIndexColor -= 1
            self.squareView.backgroundColor = self.colors[self.currentIndexColor]
            self.colorLabel.text = String(self.currentIndexColor)
        } else {
            self.currentIndexColor = self.colors.count - 1
            self.squareView.backgroundColor = self.colors[self.currentIndexColor]
            self.colorLabel.text = String(self.currentIndexColor)
        }
    }
    
    @objc private func showNextColor() {
        if self.currentIndexColor < self.colors.count - 1 {
            self.currentIndexColor += 1
            self.squareView.backgroundColor = self.colors[self.currentIndexColor]
            self.colorLabel.text = String(self.currentIndexColor)
        } else {
            self.currentIndexColor = 0
            self.squareView.backgroundColor = self.colors[self.currentIndexColor]
            self.colorLabel.text = String(self.currentIndexColor)
        }
    }
}
