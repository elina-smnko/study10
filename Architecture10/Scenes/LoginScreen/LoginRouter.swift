//
//  LoginRouter.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

final class LoginRouter {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController.initFromFlow()
        let viewModel = LoginViewModel.init(coordinator: self)
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentAccount(_ user: Account) {
        guard let navigationController = navigationController else {
            return
        }
        AccountRouter.init(navigationController: navigationController, user: user).start()
    }
}

