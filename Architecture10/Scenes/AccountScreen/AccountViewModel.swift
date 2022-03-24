//
//  AccountViewModel.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import Foundation

final class AccountViewModel {
    private var coordinator: AccountCoordinator!
    var user: Account?
    
    init(coordinator: AccountCoordinator) {
        self.coordinator = coordinator
    }
}
