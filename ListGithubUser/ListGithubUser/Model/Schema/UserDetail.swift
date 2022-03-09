//
//  UserDetail.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

final class UserDetail: Codable {

    var username: String?
    var location: String?
    var bio: String?
    var publicRepo: Int?
    var follower: Int?
    var following: Int?

    init() { }

    init(username: String, location: String, bio: String, publicRepo: Int, follower: Int, following: Int) {
        self.username = username
        self.location = location
        self.bio = bio
        self.publicRepo = publicRepo
        self.follower = follower
        self.following = following
    }

    init(from decoder: Decoder) throws {
        username = decoder.decode(CodingKeys.username, as: String.self)
        location = decoder.decode(CodingKeys.location, as: String.self)
        bio = decoder.decode(CodingKeys.bio, as: String.self)
        publicRepo = decoder.decode(CodingKeys.publicRepo, as: Int.self)
        follower = decoder.decode(CodingKeys.follower, as: Int.self)
        following = decoder.decode(CodingKeys.following, as: Int.self)
    }
}

// MARK: - Contract
extension UserDetail {
    enum CodingKeys: String, CodingKey {
        case location, bio, following
        case follower = "followers"
        case username = "name"
        case publicRepo = "public_repos"
    }
}
