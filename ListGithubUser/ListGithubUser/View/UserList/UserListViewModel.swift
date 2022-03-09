//
//  UserListViewModel.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

class UserListViewModel {

    var userList: [UserInformation] = []

    func numberOfItems() -> Int {
        return userList.count
    }

    func viewModelForCell(at indexPath: IndexPath) -> UserListCellViewModel? {
        guard indexPath.row < userList.count else { return nil }
        return UserListCellViewModel(userInformation: userList[indexPath.row])
    }

    func didSelectRow(at indexPath: IndexPath) -> UserDetailViewController {
        guard indexPath.row < userList.count else { return UserDetailViewController() }
        let userDetailViewController = UserDetailViewController()
        userDetailViewController.viewModel = UserDetailViewModel(userInformation: userList[indexPath.row])
        return userDetailViewController
    }

    func getUserList(completion: @escaping APICompletion) {
        Api.UserList.getUserList { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success(let result):
                this.update(withResult: result)
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func update(withResult result: Api.UserList.UserListResult) {
        userList = result.userList
    }
}
