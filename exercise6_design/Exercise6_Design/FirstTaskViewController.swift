//
//  FirstTaskViewController.swift
//  Exercise6_Design
//
//  Created by Karina Kovaleva on 18.07.23.
//

import UIKit

class FirstTaskViewController: UIViewController {

    private let sideImageView: CGFloat = 300
    private let margin: CGFloat = 16
    
    private lazy var squareImageView: UIImageView = {
        var squareImageView = UIImageView()
        squareImageView.translatesAutoresizingMaskIntoConstraints = false
        squareImageView.contentMode = .scaleAspectFill
        squareImageView.image = UIImage(named: "cat")
        return squareImageView
    }()
    
    private lazy var stackViewForButtons: UIStackView = {
        var stackViewForButtons = UIStackView()
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewForButtons.axis = .horizontal
        stackViewForButtons.distribution = .fillEqually
        stackViewForButtons.spacing = self.margin
        return stackViewForButtons
    }()
    
    private lazy var configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.tinted()
        configuration.buttonSize = .medium
        configuration.baseBackgroundColor = .systemMint
        return configuration
    }()
    
    private lazy var hideButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Hide"
        
        var hideButton = UIButton()
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.configuration = configuration
        
        hideButton.addTarget(self, action: #selector(self.hideImageView), for: .touchUpInside)
        return hideButton
    }()
    
    private lazy var showButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Show"
        
        var showButton = UIButton()
        showButton.translatesAutoresizingMaskIntoConstraints = false
        showButton.configuration = configuration
        
        showButton.addTarget(self, action: #selector(self.showImageView), for: .touchUpInside)
        return showButton
    }()
    
    private lazy var hiddenLabel: UILabel = {
        var hiddenLabel = UILabel()
        hiddenLabel.translatesAutoresizingMaskIntoConstraints = false
        hiddenLabel.text = "Hidden"
        return hiddenLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupStackView()
        self.setupLayout()
    }
    
    private func setupStackView() {
        self.view.addSubview(self.stackViewForButtons)
        let buttons = [self.hideButton, self.showButton]
        buttons.forEach { self.stackViewForButtons.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.stackViewForButtons.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin),
            self.stackViewForButtons.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -self.margin),
            self.stackViewForButtons.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -self.margin)
        ])
    }
    
    @objc func hideImageView(sender: UIButton) -> Void {
        self.squareImageView.removeFromSuperview()
        self.view.addSubview(self.hiddenLabel)
        
        NSLayoutConstraint.activate([
            self.hiddenLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.hiddenLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    @objc func showImageView(sender: UIButton) -> Void {
        self.hiddenLabel.removeFromSuperview()
        self.view.addSubview(self.squareImageView)
        
        NSLayoutConstraint.activate([
            self.squareImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.squareImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.squareImageView.widthAnchor.constraint(equalToConstant: self.sideImageView),
            self.squareImageView.heightAnchor.constraint(equalToConstant: self.sideImageView),
        ])
    }
}
