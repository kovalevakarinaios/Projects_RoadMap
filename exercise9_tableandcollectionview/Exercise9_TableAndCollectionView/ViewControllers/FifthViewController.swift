//
//  FifthViewController.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 1.08.23.
//

import UIKit

class FifthViewController: UIViewController {
    
    private var users = DataModel.shared.getUsers()
    private var progressBarTimer = Timer()
    
    private lazy var refreshControl: UIRefreshControl = {
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        return refreshControl
    }()
    
    private lazy var usersTableView: UITableView = {
        var usersTableView = UITableView()
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.dataSource = self
        usersTableView.register(TwoLineTableViewCell.self,
                                forCellReuseIdentifier: TwoLineTableViewCell.identifier)
        usersTableView.refreshControl = self.refreshControl
        return usersTableView
    }()
    
    private lazy var progressView: UIProgressView = {
        var progressView = UIProgressView(frame: .zero)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .bar
        return progressView
    }()
    
    private lazy var emptyLabel: UILabel = {
        var emptyLabel = UILabel()
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.text = "No users available to display"
        return emptyLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(self.addEmptyView))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        self.addProgressView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.progressView.removeFromSuperview()
            self.view.addSubview(self.usersTableView)
            self.setupLayout()
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.usersTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.usersTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.usersTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.usersTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addProgressView() {
        self.view.addSubview(self.progressView)
        self.setupConstraintsProgressView()
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateProgress), userInfo: nil, repeats: true)
    }
    
    private func setupConstraintsProgressView() {
        NSLayoutConstraint.activate([
            self.progressView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.progressView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            self.progressView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            self.progressView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    @objc private func addEmptyView() {
        self.users.removeAll()
        self.usersTableView.reloadData()
        
        self.view.addSubview(self.emptyLabel)
        
        NSLayoutConstraint.activate([
            self.emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.emptyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc private func updateProgress() {
        if progressView.progress == 1 {
            progressBarTimer.invalidate()
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            progressView.progress += 1/6
            progressView.setProgress(progressView.progress, animated: true)
        }
    }
    
    @objc private func refresh() {
        self.emptyLabel.removeFromSuperview()
        self.users.removeAll()
        self.usersTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.users = DataModel.shared.getUsers()
            self.usersTableView.reloadData()
            
            self.refreshControl.endRefreshing()
        }
    }
}

extension FifthViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TwoLineTableViewCell.identifier) as? TwoLineTableViewCell else { return TwoLineTableViewCell() }
        cell.configureCell(model: self.users[indexPath.row])
        return cell
    }
}
