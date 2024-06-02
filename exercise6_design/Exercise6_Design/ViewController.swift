//
//  ViewController.swift
//  Exercise6_Design
//
//  Created by Karina Kovaleva on 18.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var stackViewForButtons: UIStackView = {
        var stackViewForButtons = UIStackView()
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewForButtons.axis = .vertical
        stackViewForButtons.distribution = .fillEqually
        stackViewForButtons.spacing = 100
        return stackViewForButtons
    }()
    
    private lazy var configuration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.tinted()
        configuration.buttonSize = .large
        configuration.baseBackgroundColor = .systemGray
        return configuration
    }()
    
    private lazy var firstTaskButton: UIButton = {
        var configuration = configuration
        configuration.title = "First Task"
        
        var firstTaskButton = UIButton()
        firstTaskButton.configuration = configuration
        firstTaskButton.addTarget(self, action: #selector(showFirstTaskViewController), for: .touchUpInside)
        return firstTaskButton
    }()
    
    private lazy var secondTaskButton: UIButton = {
        var configuration = configuration
        configuration.title = "Second Task"
        
        var secondTaskButton = UIButton()
        secondTaskButton.configuration = configuration
        secondTaskButton.addTarget(self, action: #selector(showSecondTaskViewController), for: .touchUpInside)
        return secondTaskButton
    }()
    
    private lazy var thirdTaskButton: UIButton = {
        var configuration = configuration
        configuration.title = "Third Task"
        
        var thirdTaskButton = UIButton()
        thirdTaskButton.configuration = configuration
        thirdTaskButton.addTarget(self, action: #selector(showThirdTaskViewController), for: .touchUpInside)
        return thirdTaskButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupStackView()
        self.setupLayout()
    }
    
    private func setupStackView() {
        self.view.addSubview(self.stackViewForButtons)
        let buttons = [self.firstTaskButton, self.secondTaskButton, self.thirdTaskButton]
        buttons.forEach { self.stackViewForButtons.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.stackViewForButtons.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.stackViewForButtons.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc func showFirstTaskViewController(sender: UIButton) -> Void {
        let firstTaskViewController = FirstTaskViewController()
        self.navigationController?.pushViewController(firstTaskViewController, animated: true)
    }
    
    @objc func showSecondTaskViewController(sender: UIButton) -> Void {
        let secondTaskViewController = SecondTaskViewController()
        self.navigationController?.pushViewController(secondTaskViewController, animated: true)
    }
    
    @objc func showThirdTaskViewController(sender: UIButton) -> Void {
        let thirdTaskViewController = ThirdTaskViewController()
        self.navigationController?.pushViewController(thirdTaskViewController, animated: true)
    }
}
