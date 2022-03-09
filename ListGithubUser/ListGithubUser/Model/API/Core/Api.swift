//
//  Api.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation
import Alamofire

final class Api {

    struct Path {
        static let baseURL = "https://api.github.com"
    }

    struct UserList { }
    struct UserDetail {}
}

extension Api.Path {
    struct UserList {
        static var userList: String { return baseURL / "users" }
    }
}

protocol URLStringConvertible {
    var urlString: String { get }
}

protocol ApiPath: URLStringConvertible {
    static var path: String { get }
}

private func / (lhs: URLStringConvertible, rhs: URLStringConvertible) -> String {
    return lhs.urlString + "/" + rhs.urlString
}

extension String: URLStringConvertible {
    var urlString: String { return self }
}

private func / (left: String, right: Int) -> String {
    return left.appending("\(right)")
}
