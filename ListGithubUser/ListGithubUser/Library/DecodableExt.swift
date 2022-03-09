//
//  DecodableExt.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation

extension Encodable {
    func encoded() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

extension Decoder {

    func decode<T: Decodable, K: CodingKey>(_ key: K, as type: T.Type = T.self) -> T? {
        if let container = try? self.container(keyedBy: K.self) {
            return try? container.decode(type, forKey: key)
        } else {
            return nil
        }
    }
}
