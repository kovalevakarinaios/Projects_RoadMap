//
//  User.swift
//  Exercise9_TableAndCollectionView
//
//  Created by Karina Kovaleva on 2.08.23.
//

import Foundation

enum Sex: CaseIterable {
    case male
    case female
}

struct User {
    var firstName: String
    var lastName: String
    var age: UInt
    var sex: Sex
    var squareAvatarURL: URL
    var description: String
}
