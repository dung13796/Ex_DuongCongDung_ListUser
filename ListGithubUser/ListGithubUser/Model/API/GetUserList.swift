//
//  GetUserList.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

extension Api.UserList {
    struct UserListResult {
        var userList: [UserInformation]
    }

    static func getUserList(completion: @escaping Completion<UserListResult>) {
        let path = Api.Path.UserList.userList
        api.request(method: .get, urlString: path) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let json):
                    guard let jsonArr = json as? JSArray,
                        let data = try? JSONSerialization.data(withJSONObject: jsonArr, options: .prettyPrinted) else {
                        completion(.failure(Api.Error.json))
                        return
                    }
                    do {
                        let userList = try JSONDecoder().decode([UserInformation].self, from: data)
                        let result = UserListResult(userList: userList)
                        completion(.success(result))
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
