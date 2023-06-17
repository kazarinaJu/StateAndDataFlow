//
//  StateAnaDataFlowApp.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

@main
struct StateAnaDataFlowApp: App {
    private let user = StorageManager.shared.fetchUser()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(UserSettings(user: user))
        }
    }
}
