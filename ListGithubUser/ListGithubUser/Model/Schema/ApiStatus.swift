//
//  ApiStatus.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

final class ApiStatus {

    var code: Int?
    var message: String?

    init(from json: JSObject) {
        if let codeStr = json["code"] as? Int {
            code = codeStr
        }
        message = json["message"] as? String
    }
}
