//
//  ViewController.swift
//  Exercise8_Design
//
//  Created by Karina Kovaleva on 20.07.23.
//

import UIKit

class ViewController: UIViewController {

    private let circularProgressView = CircularProgressView()

    private lazy var animateWithRandomValuebutton: UIButton = {
        var animateWithRandomValuebutton = UIButton()
        animateWithRandomValuebutton.translatesAutoresizingMaskIntoConstraints = false
        
        var configuration = UIButton.Configuration.tinted()
        configuration.baseBackgroundColor = .systemMint
        configuration.title = "Animate wirh Random Value"
        
        animateWithRandomValuebutton.configuration = configuration
        animateWithRandomValuebutton.addTarget(self, action: #selector(changeProgressValue), for: .touchUpInside)
        
        return animateWithRandomValuebutton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(self.circularProgressView)
        self.circularProgressView.center = self.view.center

        self.view.addSubview(self.animateWithRandomValuebutton)
        
        NSLayoutConstraint.activate([
            self.animateWithRandomValuebutton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150),
            self.animateWithRandomValuebutton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc private func changeProgressValue() {
        self.circularProgressView.progressAnimation()
        
        let progress = self.circularProgressView.getProgressValue()
        self.animateWithRandomValuebutton.configuration?.title = "Animate wirh Random Value - \(progress)"
    }
}
