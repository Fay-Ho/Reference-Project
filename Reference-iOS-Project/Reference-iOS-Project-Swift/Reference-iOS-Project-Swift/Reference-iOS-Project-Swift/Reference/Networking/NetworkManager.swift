//
//  MIT License
//
//  Copyright (c) 2023 Fay-Ho
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

class NetworkManager {
    private enum File : String {
        case city
        case weather
        case mock = "Mock.bundle/"
        case json
    }
    
    private func loadFile<R: Decodable>(_ fileName: File, completion: ((_ result: Result<R, Error>) -> Void)?) {
        let jsonData = BundleProvider.loadFile(File.mock.rawValue + fileName.rawValue, type: File.json.rawValue)
        guard let data = jsonData else { return }
        parseData(data, completion: completion)
    }
    
    private func sendRequest<R: Decodable>(_ requestHandler: RequestHandler, completion: ((_ result: Result<R, Error>) -> Void)?) {
        let httpRequest = requestHandler.makeRequest()
        guard let url = URL(string: httpRequest.requestURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = httpRequest.requestMethod.rawValue
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    self.parseData(data, completion: completion)
                } else if let error = error {
                    completion?(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
    
    private func parseData<R: Decodable>(_ data: Data, completion: ((_ result: Result<R, Error>) -> Void)?) {
        do {
            try completion?(.success(JSONDecoder().decode(R.self, from: data)))
        } catch {
            completion?(.failure(error))
        }
    }
}

extension NetworkManager {
    func getCity(completion: ((_ result: Result<CityResponse, Error>) -> Void)?) {
        loadFile(.city, completion: completion)
    }
    
    func getWeather(completion: ((_ result: Result<WeatherResponse, Error>) -> Void)?) {
        sendRequest(WeatherRequest(), completion: completion)
    }
}
