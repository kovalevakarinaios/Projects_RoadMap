//
//  SecondViewController.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 1.08.23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let users = DataModel.shared.getUsers()
    
    private lazy var usersTableView: UITableView = {
        var usersTableView = UITableView()
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.register(ThreeLineTableViewCell.self, forCellReuseIdentifier: ThreeLineTableViewCell.identifier)
        return usersTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.usersTableView)
        self.setupLayout()
        
        self.usersTableView.dataSource = self
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.usersTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.usersTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.usersTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.usersTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: ThreeLineTableViewCell.identifier) as? ThreeLineTableViewCell else { return ThreeLineTableViewCell() }
        cell.configureCell(model: self.users[indexPath.row])
        return cell
    }
    
    
}
