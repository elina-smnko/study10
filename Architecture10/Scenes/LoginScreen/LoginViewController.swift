//
//  LoginViewController.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

class LoginViewController: UIViewController, StoryboardInitializable {
    var viewModel: LoginViewModel!
    
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func loginAction(_ sender: Any) {
        viewModel.login(email: emailTextField.text, password: passwordTextField.text)
    }
    
    private func setupUI() {
        loginButton.setTitle(NSLocalizedString("login", comment: ""), for: .normal)
        loginButton.tintColor = UIColor.myAppRed
    }
}
