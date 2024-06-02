//
//  ViewController.swift
//  Exercise12_Chronometer
//
//  Created by Karina Kovaleva on 14.08.23.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 0 {
        didSet {
            self.label.text = self.transformFromSecToTime(seconds: self.count)
        }
    }
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Courier-Bold", size: 30)
        label.text = self.transformFromSecToTime(seconds: self.count)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.label)
        self.setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 1.0 , repeats: true) { _ in
            self.count += 1
        }
        
//        Thread.detachNewThread {
//            Timer.scheduledTimer(withTimeInterval: 1.0 , repeats: true) { _ in
//                
//                self.count += 1
//            }
//        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    private func transformFromSecToTime(seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = seconds / 60 % 60
        let seconds = seconds % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
