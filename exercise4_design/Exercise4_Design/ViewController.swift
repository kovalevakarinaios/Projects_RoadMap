//
//  ViewController.swift
//  Exercise4_Design
//
//  Created by Karina Kovaleva on 12.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    let redView: UIView = {
        var redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor(red: 232/255, green: 24/255, blue: 28/255, alpha: 1)
        return redView
    }()
    
    let greenView: UIView = {
        var greenView = UIView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = UIColor(red: 164/255, green: 202/255, blue: 63/255, alpha: 1)
        return greenView
    }()
    
    let blueView: UIView = {
        var blueView = UIView()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.backgroundColor = UIColor(red: 93/255, green: 178/255, blue: 224/225, alpha: 1)
        return blueView
    }()
    
    let purpleView: UIView = {
        var purpleView = UIView()
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.backgroundColor = UIColor(red: 160/225, green: 105/225, blue: 198/255, alpha: 1)
        return purpleView
    }()
    
    let blackView: UIView = {
        var blackView = UIView()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return blackView
    }()
    
    let orangeView: UIView = {
        var orangeView = UIView()
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.backgroundColor = UIColor(red: 239/255, green: 142/255, blue: 52/255, alpha: 1)
        return orangeView
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupViews()
    }
    
    private func setupViews() {
        self.blackView.addSubview(self.orangeView)
        let smallViews = [greenView, blueView, purpleView, blackView]
        smallViews.forEach { self.redView.addSubview($0) }
        self.view.addSubview(self.redView)
        
        NSLayoutConstraint.activate([
            self.redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.redView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.redView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/3),
            self.redView.widthAnchor.constraint(equalTo: self.redView.heightAnchor),
            self.greenView.topAnchor.constraint(equalTo: self.redView.topAnchor),
            self.greenView.leadingAnchor.constraint(equalTo: self.redView.leadingAnchor),
            self.blackView.topAnchor.constraint(equalTo: self.redView.topAnchor),
            self.blackView.trailingAnchor.constraint(equalTo: self.redView.trailingAnchor),
            self.blueView.bottomAnchor.constraint(equalTo: self.redView.bottomAnchor),
            self.blueView.leadingAnchor.constraint(equalTo: self.redView.leadingAnchor),
            self.purpleView.centerXAnchor.constraint(equalTo: self.redView.centerXAnchor),
            self.purpleView.centerYAnchor.constraint(equalTo: self.redView.centerYAnchor),
            self.orangeView.topAnchor.constraint(equalTo: self.blackView.topAnchor),
            self.orangeView.trailingAnchor.constraint(equalTo: self.blackView.trailingAnchor),
            self.orangeView.heightAnchor.constraint(equalTo: self.blackView.heightAnchor, multiplier: 1/2),
            self.orangeView.widthAnchor.constraint(equalTo: self.orangeView.heightAnchor)
        ])
        
        smallViews.forEach { $0.widthAnchor.constraint(equalTo: self.redView.widthAnchor, multiplier: 1/6).isActive = true }
        smallViews.forEach { $0.heightAnchor.constraint(equalTo: $0.widthAnchor).isActive = true }
    }
}
