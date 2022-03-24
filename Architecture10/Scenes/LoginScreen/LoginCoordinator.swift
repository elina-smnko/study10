//
//  LoginCoordinator.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

final class LoginCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController.initFromFlow()
        let viewModel = LoginViewModel.init(coordinator: self)
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func presentAccount(_ user: Account) {
        AccountCoordinator.init(navigationController: navigationController, user: user).start()
    }
}

