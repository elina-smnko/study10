//
//  AccountRouter.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

final class AccountRouter {
    
    let navigationController: UINavigationController
    let user: Account
    
    init(navigationController: UINavigationController, user: Account) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let viewController = AccountViewController.initFromFlow()
        let viewModel = AccountViewModel.init(coordinator: self)
        viewModel.user = user
        viewController.viewModel = viewModel
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }
}
