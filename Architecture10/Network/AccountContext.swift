//
//  AccountContext.swift
//  Architecture10
//
//  Created by Elina Semenko on 24.03.2022.
//

import Foundation

enum AccountError: Error {
    case dataError
    case serverError
}

class AccountContext {
    static let shared = AccountContext()
    
    private init() {}
    
    func fetchUser(completion: @escaping (Result<Account, AccountError>) -> ()) {
        let url = URL(string: "https://randomuser.me/api/")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let _ = error {
                completion(.failure(.serverError))
                return
            }
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            do{
                let accounts = try JSONDecoder().decode(AccountResults.self, from: data)
                guard let account = accounts.results?.first else {
                    completion(.failure(.dataError))
                    return
                }
//                UserDefaults.standard.set(account, forKey: self.dataKey)
//                UserDefaults.standard.set(true, forKey: self.loggedKey)
                completion(.success(account))
            }catch{
                completion(.failure(.dataError))
            }
        }
        task.resume()
    }
}
