//
//  ViewController.swift
//  Exercise3_Design
//
//  Created by Karina Kovaleva on 12.07.23.
//

import UIKit

class ViewController: UIViewController {

    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var leftView: UIView = {
        var leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.backgroundColor = .systemOrange
        return leftView
    }()
    
    lazy var middleView: UIView = {
        var middleView = UIView()
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.backgroundColor = .systemRed
        return middleView
    }()
    
    lazy var rightView: UIView = {
        var rightView = UIView()
        rightView.translatesAutoresizingMaskIntoConstraints = false
        rightView.backgroundColor = .systemPurple
        return rightView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.addStackView()
    }
    
    private func addStackView() {
        self.view.addSubview(self.stackView)
        let views = [leftView, middleView, rightView]
        views.forEach { self.stackView.addArrangedSubview($0) }
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.leftView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            self.leftView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25),
            self.middleView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.85),
            self.middleView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            self.rightView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8),
            self.rightView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25)
        ])
    }
}
