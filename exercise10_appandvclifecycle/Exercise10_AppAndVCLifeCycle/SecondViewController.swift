//
//  SecondViewController.swift
//  Exercise10_AppAndVCLifeCycle
//
//  Created by Karina Kovaleva on 9.08.23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var myView: UIView = {
        var view = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()
    
    override func loadView() {
        super.loadView()
        print("loadView - SecondViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad - SecondViewController")
        self.view.backgroundColor = .blue
        self.view.addSubview(self.myView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear - SecondViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear - SecondViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear - SecondViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear - SecondViewController")
    }
}
