//
//  UserDetailTest.swift
//  ListGithubUserTests
//
//  Created by Dung Duong C. on 3/10/22.
//

import XCTest
import OHHTTPStubs
@testable import ListGithubUser

class UserDetailTest: XCTestCase {

    var viewModel: UserDetailViewModel!

    override func setUp() {
        super.setUp()
        viewModel = UserDetailViewModel(userInformation: UserInformation(name: "hello", url: "https://api.github.com/users/2", htmlUrl: "https://github.com/2", avatar: "https://avatars.githubusercontent.com/u/1?v=4"))
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testGetUserDetailSuccess() {
        let promise = expectation(description: "Request Success")
        let data = Data(forResource: "UserDetail", ofType: "json", on: self)
        HTTPStubs.stubRequests(passingTest: { (_) -> Bool in
            return true
        }) {(_) -> HTTPStubsResponse in
            return HTTPStubsResponse(data: data, statusCode: 200, headers: ["Content-Type": "application/json"])
        }
        viewModel.getUserDetail { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                XCTAssertEqual(this.viewModel.userDetail.follower, 4)
                XCTAssertEqual(this.viewModel.userDetail.username, "hello")
                promise.fulfill()
            case .failure: break
            }
        }
        waitForExpectations(timeout: 60.0, handler: nil)
    }
}

