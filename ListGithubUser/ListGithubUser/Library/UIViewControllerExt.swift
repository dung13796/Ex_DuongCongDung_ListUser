//
//  UIViewControllerExt.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/10/22.
//

import UIKit

extension UIViewController {
    func showAlert(
        title: String?,
        message: String?,
        buttonTitles: [String]? = nil,
        buttonStyles: [UIAlertAction.Style]? = nil,
        completion: ((Int) -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.isEmpty {
            allButtons.append("OK")
        }

        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let buttonStyle: UIAlertAction.Style = buttonStyles?[index] ?? .default
            let action = UIAlertAction(title: buttonTitle, style: buttonStyle, handler: { (_) in
                completion?(index)
            })
            alertController.addAction(action)
        }
        present(alertController, animated: true, completion: nil)
    }

}
