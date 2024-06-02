//
//  TabBarController.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 1.08.23.
//

import UIKit

class TabBarController: UITabBarController {

    private let firstVC = FirstViewController()
    private let secondVC = SecondViewController()
    private let thirdVC = ThirdViewController()
    private let fourthVC = FourthViewController()
    private let fifthVC = FifthViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .systemBackground
        self.tabBar.tintColor = .systemOrange
        self.tabBar.unselectedItemTintColor = .systemGray2
        self.createTabBarItems()
    }
    
    private func createTabBarItems() {
        self.firstVC.tabBarItem = UITabBarItem(title: "User Two-line",image: UIImage(systemName: "person"), tag: 0)
        self.secondVC.tabBarItem = UITabBarItem(title: "User More-line",image: UIImage(systemName: "person.2"), tag: 0)
        self.thirdVC.tabBarItem = UITabBarItem(title: "Collection",image: UIImage(systemName: "table"), tag: 0)
        self.fourthVC.tabBarItem = UITabBarItem(title: "Asymmetry",image: UIImage(systemName: "table.badge.more"), tag: 0)
        
        let fifthNC = UINavigationController(rootViewController: self.fifthVC)
        fifthNC.tabBarItem = UITabBarItem(title: "Loading",image: UIImage(systemName: "scribble.variable"), tag: 0)

        self.viewControllers = [self.firstVC, self.secondVC, self.thirdVC, self.fourthVC, fifthNC]
    }
}
