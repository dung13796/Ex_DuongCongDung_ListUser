//
//  StringExt.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

extension Optional where Wrapped == String {

    var content: String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
}
