//
//  Error.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation
import Alamofire

typealias Network = NetworkReachabilityManager

// MARK: - Network
extension Network {

    static let shared: Network = {
        guard let manager = Network() else {
            fatalError("Cannot alloc network reachability manager!")
        }
        return manager
    }()
}

// MARK: - Define error
extension Api {

    struct Error {
        static let network = NSError(domain: NSCocoaErrorDomain, code: -999, message: "Occurred network connection error. Please check your network connection and try again.")
        static let json = NSError(domain: NSCocoaErrorDomain, code: 3_840, message: "The operation couldn’t be completed.")
        static let cancelRequest = NSError(domain: Api.Path.baseURL, code: 999, message: "Server returns no information and closes the connection.")
        static let noResponse = NSError(status: .noResponse)
        static let connectionAbort: NSError = NSError(domain: NSPOSIXErrorDomain, code: 53, message: "Software caused connection abort.")
        static let connectionWasLost: NSError = NSError(domain: NSURLErrorDomain, code: -1_005, message: "The network connection was lost.")
        static let requestTimeOut = NSError(domain: NSCocoaErrorDomain, code: -1001, message: "The request is time out")
        static let errorNetwork = NSError(domain: NSCocoaErrorDomain, code: -1009, message: "Occurred network connection error. Please check your network connection and try again.")

    }
}

extension Error {

    func show() {
        let `self` = self as NSError
        self.show()
    }

    public var code: Int {
        let `self` = self as NSError
        return self.code
    }

    public var errorsString: [String] {
        let `self` = self as NSError
        return self.errorsString
    }
}

extension NSError {
    func show() { }
}

private struct ErrorFieldKey {
    static var errors = "Errors"
}

extension NSError {

    convenience init(domain: String? = nil, status: HTTPStatus, message: String? = nil) {
        let domain = domain ?? Bundle.main.bundleIdentifier ?? ""
        let userInfo: [String: String] = [NSLocalizedDescriptionKey: message ?? status.description]
        self.init(domain: domain, code: status.code, userInfo: userInfo)
    }

    convenience init(domain: String? = nil, code: Int = -999, message: String) {
        let domain = domain ?? Bundle.main.bundleIdentifier ?? ""
        let userInfo: [String: String] = [NSLocalizedDescriptionKey: message]
        self.init(domain: domain, code: code, userInfo: userInfo)
    }

    var errorsString: [String] {
        set {
            objc_setAssociatedObject(self, &ErrorFieldKey.errors, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            guard let errors = objc_getAssociatedObject(self, &ErrorFieldKey.errors) as? [String] else { return [] }
            return errors
        }
    }
}
