//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            UserNameTF(
                name: $userSettings.user.name,
                nameIsValid: userSettings.nameIsValid
            )
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userSettings.nameIsValid)
        }
    }
    
    private func login() {
        userSettings.user.isRegistered.toggle()
        StorageManager.shared.save(user: userSettings.user)
    }
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text(name.count.formatted())
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
