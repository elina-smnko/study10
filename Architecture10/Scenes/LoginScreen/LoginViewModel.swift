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
    private var coordinator: LoginCoordinator!
    static let server = "www.example.com"
    
    private let dataKey = "dataKey"
    private let loggedKey = "loggedKey"
    
    init(coordinator: LoginCoordinator) {
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
                    UserDefaults.standard.set(user, forKey: self.dataKey)
                    UserDefaults.standard.set(true, forKey: self.loggedKey)
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
        let account = credentials.email
        let password = credentials.password.data(using: String.Encoding.utf8)!
        let query: [String: Any] = [kSecClass as String: kSecClassInternetPassword,
                                    kSecAttrAccount as String: account,
                                    kSecAttrServer as String: LoginViewModel.server,
                                    kSecValueData as String: password]
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        
    }
}
