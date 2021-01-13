//
//  UserDefaultManager.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import Foundation

class UserDefaultManager {
    
    enum UserDefaultKey: String {
        case musicSource
        case musicCategory
        case musicCountry
        case musicCount
        case musicExplicit
    }
    
    static let shared = UserDefaultManager()
    
    private init() {}
    
    func save(value: Any, for key: UserDefaultKey) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func loadInt(for key: UserDefaultKey) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    func loadBool(for key: UserDefaultKey) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
}
