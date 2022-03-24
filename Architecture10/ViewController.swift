//
//  ViewController.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

class ViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        LoginCoordinator.init(navigationController: self).start()
    }


}

