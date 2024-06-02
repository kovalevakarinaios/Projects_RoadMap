//
//  ViewController.swift
//  Exercise1_Design
//
//  Created by Karina Kovaleva on 10.07.23.
//

import UIKit

class ViewController: UIViewController {

    let heightOfContents: CGFloat = 50
    let inset: CGFloat = 10
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layer.borderWidth = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        stackView.spacing = 25
        return stackView
    }()
    
    lazy var topView: UIView = {
        var topView = UIView()
        topView.backgroundColor = .systemIndigo
        topView.frame.size.height = heightOfContents
        return topView
    }()
    
    lazy var middleView: UIView = {
        var middleView = UIView()
        middleView.backgroundColor = .systemRed
        middleView.frame.size.height = heightOfContents
        return middleView
    }()
    
    lazy var bottomView: UIView = {
        var bottomView = UIView()
        bottomView.backgroundColor = .systemYellow
        bottomView.frame.size.height = heightOfContents
        return bottomView
    }()
    
    
    lazy var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.addStackView()
    }
    
    private func addStackView() {
        self.view.addSubview(stackView)
        let views = [topView, middleView, bottomView, button]
        views.forEach { self.stackView.addArrangedSubview($0)}
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -inset)
        ])
    }
}
