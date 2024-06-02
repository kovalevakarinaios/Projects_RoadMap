//
//  ViewController.swift
//  Exercise11_AppAndVCLifeCycle
//
//  Created by Karina Kovaleva on 9.08.23.
//

import UIKit

protocol FirstViewControllerDelegate: AnyObject {
    func updateCornerRadius(_ increaseCornerRadius: CGFloat)
}

class ViewController: UIViewController, FirstViewControllerDelegate {
    
    private var storage: CornerRadiusStorageProtocol!
    
    private var cornerRadius = CGFloat() {
        didSet {
            storage.save(cornerRadius: cornerRadius)
        }
    }
    
    private lazy var yellowView: UIView = {
        var yellowView = UIView()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.backgroundColor = .systemYellow
        return yellowView
    }()
    
    private lazy var cornerRaduisLabel: UILabel = {
        var cornerRaduisLabel = UILabel()
        cornerRaduisLabel.translatesAutoresizingMaskIntoConstraints = false
        cornerRaduisLabel.text = ("\(self.cornerRadius)")
        cornerRaduisLabel.textAlignment = .center
        return cornerRaduisLabel
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.showSecondVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupLayout()
        
        storage = CornerRadiusStorage()
        self.loadCornerRadius()
        
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            scene.delegate = self
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.button.layer.cornerRadius = self.button.frame.size.width / 2
    }

    private func setupLayout() {
        self.view.addSubview(self.yellowView)
        self.yellowView.addSubview(self.cornerRaduisLabel)
        self.yellowView.addSubview(self.button)
        
        NSLayoutConstraint.activate([
            self.yellowView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.yellowView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.yellowView.heightAnchor.constraint(equalTo: self.yellowView.widthAnchor),
            self.yellowView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.yellowView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            
            self.cornerRaduisLabel.topAnchor.constraint(equalTo: self.yellowView.topAnchor, constant: 5),
            self.cornerRaduisLabel.leadingAnchor.constraint(equalTo: self.yellowView.leadingAnchor, constant: 5),
            self.cornerRaduisLabel.trailingAnchor.constraint(equalTo: self.yellowView.trailingAnchor, constant: -5),
            
            self.button.widthAnchor.constraint(equalTo: self.yellowView.widthAnchor, multiplier: 1/3),
            self.button.heightAnchor.constraint(equalTo: self.button.widthAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.yellowView.bottomAnchor, constant: -5),
            self.button.centerXAnchor.constraint(equalTo: self.yellowView.centerXAnchor)
        ])
    }
    
    @objc private func showSecondVC() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func loadCornerRadius() {
        self.cornerRadius = self.storage.load()
    }
    
    internal func updateCornerRadius(_ increaseCornerRadius: CGFloat) {
        cornerRadius += increaseCornerRadius
        self.yellowView.layer.cornerRadius = cornerRadius
        self.cornerRaduisLabel.text = "\(self.yellowView.layer.cornerRadius)"
    }
}
