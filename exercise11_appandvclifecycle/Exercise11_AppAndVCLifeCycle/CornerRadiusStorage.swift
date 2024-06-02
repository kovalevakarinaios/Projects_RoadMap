//
//  CornerRadiusStorage.swift
//  Exercise11_AppAndVCLifeCycle
//
//  Created by Karina Kovaleva on 9.08.23.
//

import Foundation

protocol CornerRadiusStorageProtocol {
    func load() -> CGFloat
    func save(cornerRadius: CGFloat)
}

class CornerRadiusStorage: CornerRadiusStorageProtocol {
    private var storage = UserDefaults.standard
    private let storageKey = "CornerRadius"
    
    func load() -> CGFloat {
        let cornerRadiusFromStorage = storage.double(forKey: storageKey)
        return CGFloat(cornerRadiusFromStorage)
    }
    
    func save(cornerRadius: CGFloat) {
        storage.set(Double(cornerRadius), forKey: storageKey)
    }
}
