//
//  AppDelegate.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configWindow()
        return true
    }

    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let userListViewController = UserListViewController()
        window?.rootViewController = UINavigationController(rootViewController: userListViewController)
        window?.makeKeyAndVisible()
    }
}

