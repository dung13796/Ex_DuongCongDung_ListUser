//
//  ApiManager.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion<Value> = (Result<Value>) -> Void
typealias APICompletion = (APIResult) -> Void
typealias UserDetailCompletion = (UserDetailResult) -> Void

enum APIResult {
    case success
    case failure(Error)
}

enum UserDetailResult {
    case success(UserDetail)
    case failure(Error)
}


// MARK: - Equatable

extension APIResult: Equatable {

    public static func == (lhs: APIResult, rhs: APIResult) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failure(let lhsError), .failure(let rhsError)):
            return lhsError.code == rhsError.code && lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}

// MARK: - Get error for api result
extension APIResult {

    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

let api = ApiManager()

final class ApiManager {

    var defaultHTTPHeaders: [String: String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/vnd.github.v3+json"
        headers["Accept"] = "application/vnd.github.v3+json"
        return headers
    }
}
