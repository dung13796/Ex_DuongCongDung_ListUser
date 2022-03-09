//
//  UserInformation.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

final class UserInformation: Codable {

    var name: String?
    var url: String?
    var htmlUrl: String?
    var avatar: String?

    init() { }

    init(name: String, url: String, htmlUrl: String, avatar: String) {
        self.name = name
        self.url = url
        self.htmlUrl = htmlUrl
        self.avatar = avatar
    }

    init(from decoder: Decoder) throws {
        name = decoder.decode(CodingKeys.name, as: String.self)
        url = decoder.decode(CodingKeys.url, as: String.self)
        htmlUrl = decoder.decode(CodingKeys.htmlUrl, as: String.self)
        avatar = decoder.decode(CodingKeys.avatar, as: String.self)
    }
}

// MARK: - Contract
extension UserInformation {
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case url = "url"
        case htmlUrl = "html_url"
        case avatar = "avatar_url"
    }
}
