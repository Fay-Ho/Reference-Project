//
//  Networking.swift
//  Reference-iOS-Project-Swift
//
//  Created by Fay on 2023/8/6.
//  Copyright © 2023 Fay. All rights reserved.
//

import Foundation

class Networking {
    func sendRequest(_ httpRequest: HTTPRequest, success: @escaping (_ resultData: Data) -> Void, failure: @escaping (_ error: Error) -> Void) {
        guard let url = URL(string: httpRequest.requestURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = httpRequest.requestMethod.rawValue
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let resultData = data {
                DispatchQueue.main.async {
                    success(resultData)
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
        dataTask.resume()
    }
}
