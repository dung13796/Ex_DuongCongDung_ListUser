//
//  GetUserDetail.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

extension Api.UserDetail {

    static func getUserList(path: String, completion: @escaping UserDetailCompletion) {
        let path = path
        api.request(method: .get, urlString: path) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let json):
                    guard let json = json as? JSObject,
                        let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else {
                        completion(.failure(Api.Error.json))
                        return
                    }
                    do {
                        let userDetail = try JSONDecoder().decode(UserDetail.self, from: data)
                        completion(.success(userDetail))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
