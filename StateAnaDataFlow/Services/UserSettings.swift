//
//  UserSettings.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import Foundation

struct User: Codable {
    var name = ""
    var isRegistered = false
}

final class UserSettings: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}


