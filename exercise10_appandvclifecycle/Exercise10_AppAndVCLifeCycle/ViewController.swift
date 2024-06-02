//
//  ViewController.swift
//  Exercise10_AppAndVCLifeCycle
//
//  Created by Karina Kovaleva on 8.08.23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var myView: UIView = {
        var view = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton(frame: CGRect(x: 100, y: 200, width: 50, height: 10))
        button.setTitle("Tap", for: .normal)
        button.addTarget(self, action: #selector(self.showSecondVC), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        print("loadView - VC")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad - VC")
        self.view.backgroundColor = .gray
        self.view.addSubview(self.myView)
        self.view.addSubview(self.button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - VC")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - VC")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - VC")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear - VC")
    }
    
    @objc private func showSecondVC() {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
