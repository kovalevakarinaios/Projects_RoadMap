//
//  ViewController.swift
//  Exercise5_Design
//
//  Created by Karina Kovaleva on 13.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    private let profileView = ProfileView(frame: .zero)
    private var users = [User]()
    private var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileView.frame = self.view.bounds
        self.createUsers()
        self.view.addSubview(self.profileView)
        self.profileView.createView(user: self.users[0])
        self.updateProfiles()
    }
    
    private func createUsers() {
        users.append(User(mainImage: "1", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "2", name: "Jenny Ford", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "3", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "4", name: "Misty Murray", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "5", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "6", name: "Elizabeth Smith", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "7", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "8", name: "Jennifer Vargas", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "9", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "10", name: "Sara Ramos", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "11", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "12", name: "Yolanda Simmons", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "13", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "14", name: "Claudia Williamson", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "15", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "16", name: "Lucille Henderson", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "17", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "18", name: "Ashley Moore", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
        users.append(User(mainImage: "19", newsText: "Model winner of 2018 Tokyo Art costume design week", avatarImage: "20", name: "Shirley Riley", status: Int.random(in: 1...15), recommendedUsers: Int.random(in: 1...30), allUsers: Int.random(in: 31...99), numberOfViews: Int.random(in: 1...10000), numberOfComments: Int.random(in: 1...10000), numberOfLikes: Int.random(in: 1...10000)))
    }
    
    private func updateProfiles() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            self.profileView.createView(user: self.users[self.counter])
            (self.counter == self.users.count - 1) ? (self.counter = 0) : (self.counter += 1)
        }
    }
}
