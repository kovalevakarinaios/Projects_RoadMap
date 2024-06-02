//
//  ViewController.swift
//  Exercise2_Design
//
//  Created by Karina Kovaleva on 11.07.23.
//

import UIKit

class ViewController: UIViewController {

    let heightOfView: CGFloat = 150
    let contentMargin: CGFloat = 24
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()

    lazy var topView: UIView = {
        var topView = UIView()
        topView.backgroundColor = .systemRed
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    lazy var bottomView: UILabel = {
        var bottomView = UILabel()
        bottomView.backgroundColor = .systemYellow
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        return bottomView
    }()
    
    lazy var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupScrollView()
    }

    private func setupScrollView() {
        self.scrollView.addSubview(self.mainView)
        self.view.addSubview(self.scrollView)
        self.setupMainView()
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupMainView() {
        let views = [self.topView, self.bottomView, self.button]
        views.forEach { self.mainView.addSubview($0) }

        let mainViewHeightConstraint =  self.mainView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        mainViewHeightConstraint.isActive = true
        mainViewHeightConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.mainView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),

            self.topView.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: contentMargin),
            self.topView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: contentMargin),
            self.topView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -contentMargin),
            self.topView.heightAnchor.constraint(equalToConstant: heightOfView),
            
            self.bottomView.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: contentMargin),
            self.bottomView.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: contentMargin),
            self.bottomView.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -contentMargin),
            self.bottomView.heightAnchor.constraint(equalToConstant: heightOfView * 3),
            
            self.button.topAnchor.constraint(greaterThanOrEqualTo: self.bottomView.bottomAnchor, constant: 40),
            self.button.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: contentMargin),
            self.button.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor, constant: -contentMargin),
            self.button.bottomAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: -contentMargin)
        ])
    }
}
