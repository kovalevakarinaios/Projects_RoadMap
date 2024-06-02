//
//  SecondViewController.swift
//  Exercise11_AppAndVCLifeCycle
//
//  Created by Karina Kovaleva on 9.08.23.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.goBack))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.updateCornerRadius))
    }
    
    @objc private func updateCornerRadius() {
        self.delegate?.updateCornerRadius(10)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
