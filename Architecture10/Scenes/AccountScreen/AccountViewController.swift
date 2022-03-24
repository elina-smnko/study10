//
//  AccountViewController.swift
//  Architecture10
//
//  Created by Elina Semenko on 23.03.2022.
//

import UIKit

class AccountViewController: UIViewController, StoryboardInitializable {
    var viewModel: AccountViewModel!

    @IBOutlet weak private var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUser()
    }
    
    func showUser() {
        guard let user = viewModel.user else { return }
        textView.text = """
Gender: \(user.gender ?? "")\n
Name: \(user.name?.title ?? "") \(user.name?.first ?? "") \(user.name?.last ?? "")\n
Location: \(user.location?.country ?? "") \(user.location?.city ?? "") \(user.location?.postcode ?? 0)\n
Phone: \(user.phone ?? "")\n
Cell: \(user.cell ?? "")
"""
    }
    
    @IBAction func logout(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
