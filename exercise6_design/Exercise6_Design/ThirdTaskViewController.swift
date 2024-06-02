//
//  ThirdTaskViewController.swift
//  Exercise6_Design
//
//  Created by Karina Kovaleva on 19.07.23.
//

import UIKit

class ThirdTaskViewController: UIViewController {
    
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
    
    private lazy var removeAlphaButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Remove Alpha"
        
        var removeAlphaButton = UIButton()
        removeAlphaButton.translatesAutoresizingMaskIntoConstraints = false
        removeAlphaButton.configuration = configuration
        
        removeAlphaButton.addTarget(self, action: #selector(self.removeAlpha), for: .touchUpInside)
        return removeAlphaButton
    }()
    
    private lazy var addAlfaButton: UIButton = {
        var configuration = self.configuration
        configuration.title = "Add alpha"
        
        var addAlfaButton = UIButton()
        addAlfaButton.translatesAutoresizingMaskIntoConstraints = false
        addAlfaButton.configuration = configuration
        
        addAlfaButton.addTarget(self, action: #selector(self.addAlpha), for: .touchUpInside)
        return addAlfaButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.squareImageView)
        self.setupStackView()
        self.setupLayout()
    }
    
    private func setupStackView() {
        self.view.addSubview(self.stackViewForButtons)
        let buttons = [self.removeAlphaButton, self.addAlfaButton]
        buttons.forEach { self.stackViewForButtons.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.squareImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.squareImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.squareImageView.widthAnchor.constraint(equalToConstant: self.sideImageView),
            self.squareImageView.heightAnchor.constraint(equalToConstant: self.sideImageView),
            self.stackViewForButtons.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin),
            self.stackViewForButtons.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -self.margin),
            self.stackViewForButtons.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -self.margin)
        ])
    }
    
    @objc func removeAlpha(sender: UIButton) -> Void {
        if self.squareImageView.alpha > 0 {
            UIView.animate(withDuration: 1, animations: {
                self.squareImageView.transform = self.squareImageView.transform.rotated(by: .pi / 2)
            })
            self.squareImageView.alpha -= 0.1
        }
    }
    
    @objc func addAlpha(sender: UIButton) -> Void {
        if self.squareImageView.alpha < 1 {
            UIView.animate(withDuration: 1, animations: {
                self.squareImageView.transform = self.squareImageView.transform.rotated(by: .pi / -2)
            })
            self.squareImageView.alpha += 0.1
        }
    }
}
