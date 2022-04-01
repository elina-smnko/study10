//
//  LoginViewModel.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import Foundation

struct Credentials {
    var email: String
    var password: String
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

final class LoginViewModel {
    private var coordinator: LoginRouter!
    
    private let dataKey = "dataKey"
    private let loggedKey = "loggedKey"
    
    init(coordinator: LoginRouter) {
        self.coordinator = coordinator
    }
    
    func login(email: String?, password: String?) {
        if !validate(email: email, password: password) { return }
        AccountContext.shared.fetchUser { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(user):
                DispatchQueue.main.async {
                    self.presentAccount(user)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func validate(email: String?, password: String?) -> Bool {
        if email?.count ?? 0 <= 5 {
            print("email not valid")
            return false
        }
        
        if password?.count ?? 0 <= 5 {
            print("password not valid")
            return false
        }
        
        return true
    }
    
    private func presentAccount(_ user: Account) {
        coordinator.presentAccount(user)
    }
    
    private func save(credentials: Credentials) throws {
        guard let password = credentials.password.data(using: String.Encoding.utf8) else { return }
        try KeychainInterface.save(password: password, service: KeychainInterface.service, account: credentials.email)
    }
}
