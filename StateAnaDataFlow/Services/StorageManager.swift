//
//  StorageManager.swift
//  StateAnaDataFlow
//
//  Created by Юлия Ястребова on 17.06.2023.
//

import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "user"
    
    private init() {}
    
    func save(user: User) {
        // let user = fetchUser()
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func deleteUser(userSettings: UserSettings) {
        userSettings.user.name = ""
        userSettings.user.isRegistered = false
    }
    
    func fetchUser() -> User {
        guard let data = userDefaults.data(forKey: key) else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: data) else { return User() }
        return user
    }
}
