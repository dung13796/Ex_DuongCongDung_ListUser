//
//  ResponseSerializer.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation
import Alamofire

extension Request {
    static func responseJSONSerializer(log: Bool = true,
                                       response: HTTPURLResponse?,
                                       data: Data?,
                                       error: Error?) -> Result<Any> {
        guard let response = response else {
            if let error = error {
                let errorCode = error.code
                if abs(errorCode) == Api.Error.cancelRequest.code { // code is 999 or -999
                    return .failure(Api.Error.cancelRequest)
                }
                return .failure(error)
            }
            return .failure(Api.Error.noResponse)
        }

        let statusCode = response.statusCode

        if let error = error {
            return .failure(error)
        }

        if 204...205 ~= statusCode { // empty data status code
            return .success([:])
        }

        guard 200...299 ~= statusCode else {
            // Cancel request
            if statusCode == Api.Error.cancelRequest.code {
                return .failure(Api.Error.cancelRequest)
            }

            var err: NSError!
            if let json = data?.toJSON() as? JSObject,
                let errors = json["errors"] as? [String],
                !errors.isEmpty {
                let message = errors.reduce("", { $0 + $1 + "\n" }).trimmed
                err = NSError(code: statusCode, message: message)
            } else if let status = HTTPStatus(code: statusCode) {
                err = NSError(domain: Api.Path.baseURL, status: status)
            } else {
                err = NSError(domain: Api.Path.baseURL,
                              code: statusCode,
                              message: "Unknown HTTP status code received (\(statusCode)).")
            }
            return .failure(err)
        }

        guard let data = data,
              let json = data.toJSON() else {
            return .failure(Api.Error.json)
        }
        return .success(json)
    }
}

extension DataRequest {
    static func responseSerializer() -> DataResponseSerializer<Any> {
        return DataResponseSerializer { _, response, data, error in
            return Request.responseJSONSerializer(log: true,
                                                  response: response,
                                                  data: data,
                                                  error: error)
        }
    }

    @discardableResult
    func responseJSON(queue: DispatchQueue = .global(qos: .background),
                      completion: @escaping (DataResponse<Any>) -> Void) -> Self {
        return response(queue: queue,
                        responseSerializer: DataRequest.responseSerializer(),
                        completionHandler: completion)
    }
}

extension Data {
    func toJSON() -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.allowFragments)
        } catch {
            return nil
        }
    }

    func toString(_ encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String(data: self, encoding: encoding)
    }

    func toJSObject() -> JSObject? {
        return self.toJSON() as? JSObject
    }
}

extension String {
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
