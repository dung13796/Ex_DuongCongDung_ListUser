//
//  StatsViewModel.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

final class StatsViewModel {
    var number: Int
    var title: String

    init(number: Int, title: InfoType) {
        self.title = title.title
        self.number = number
    }
}

extension StatsViewModel {
    enum InfoType {
        case publicRepo
        case follower
        case following

        var title: String {
            switch self {
            case .publicRepo:
                return "PUBLIC REPO"
            case .follower:
                return "FOLLOWERS"
            case .following:
                return "FOLLOWING"
            }
        }
    }
}
