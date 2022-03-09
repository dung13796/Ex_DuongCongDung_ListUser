//
//  DataExt.swift
//  ListGithubUserTests
//
//  Created by Dung Duong C. on 3/10/22.
//

import Foundation
@testable import ListGithubUser

extension Data {

    init(forResource name: String?, ofType ext: String?, on `class`: AnyObject) {
        let bundle = Bundle(for: type(of: `class`))
        guard let path = bundle.path(forResource: name, ofType: ext),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("\(String(describing: name)) is not valid or unselecting target member ship")
        }
        self = data
    }
}
