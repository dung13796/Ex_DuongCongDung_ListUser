//
//  ViewController.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configTitleNavigationBar()
        configTitleNavigationBar()
        configBackButton()
    }

    private func configTitleNavigationBar() {
        switch self {
        case is UserDetailViewController:
            title = "Profile"
        case is UserListViewController:
            title = "User List"
        default: break
        }
    }

    private func configBackButton() {
        switch self {
        case is UserDetailViewController:
            let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTouchUpInside))
            navigationItem.leftBarButtonItem = closeButton
        default: break
        }
    }

    @objc private func closeButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}
