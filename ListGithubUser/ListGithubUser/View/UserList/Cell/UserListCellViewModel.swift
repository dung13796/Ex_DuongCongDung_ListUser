//
//  UserListCellViewModel.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

final class UserListCellViewModel {
    var userInformation: UserInformation

    init(userInformation: UserInformation) {
        self.userInformation = userInformation
    }
}
