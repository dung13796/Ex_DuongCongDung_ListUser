//
//  UserDetailViewModel.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

final class UserDetailViewModel {
    var userDetail = UserDetail()
    var userInformation: UserInformation?

    init(userInformation: UserInformation? = nil) {
        self.userInformation = userInformation
    }

    func viewModelForPublicRepoView() -> StatsViewModel {
        guard let number = userDetail.publicRepo else { return StatsViewModel(number: 0, title: .publicRepo) }
        return StatsViewModel(number: number, title: .publicRepo)
    }

    func viewModelForFollowerView() -> StatsViewModel {
        guard let number = userDetail.follower else { return StatsViewModel(number: 0, title: .follower) }
        return StatsViewModel(number: number, title: .follower)
    }

    func viewModelForFollowingView() -> StatsViewModel {
        guard let number = userDetail.following else { return StatsViewModel(number: 0, title: .following) }
        return StatsViewModel(number: number, title: .following)
    }

    func getUserDetail(completion: @escaping APICompletion) {
        guard let userInformation = userInformation, let path = userInformation.url else { return }
        Api.UserDetail.getUserList(path: path) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success(let userDetail):
                this.updateData(withResult: userDetail)
                completion(.success)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateData(withResult result: UserDetail) {
        userDetail = result
    }
}
