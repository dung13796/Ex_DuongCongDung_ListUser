//
//  UITableViewExt.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        let className = String(describing: name)
        guard let cell = dequeueReusableCell(withIdentifier: className) as? T else {
            fatalError("Couldn't find UITableViewCell for \(className), make sure the cell is registered with table view")
        }
        return cell
    }
}
