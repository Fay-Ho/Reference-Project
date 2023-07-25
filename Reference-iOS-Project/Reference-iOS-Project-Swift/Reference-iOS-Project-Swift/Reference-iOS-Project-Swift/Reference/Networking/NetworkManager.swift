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
    private let mockBundle = "Mock.bundle/"
    private let jsonFile = "json"
    
    private enum MockFile: String {
        case city = "get_city"
        case weather = "get_weather"
    }
    
    private func sendRequest<R: Decodable>(fileName: MockFile, completion: ((_ response: R?) -> Void)?) {
        let jsonData = BundleProvider.loadFile(mockBundle + fileName.rawValue, type: jsonFile)
        guard let data = jsonData else { return }
        parseData(data: data, completion: completion)
    }
    
    private func parseData<R: Decodable>(data: Data, completion: ((_ response: R?) -> Void)?) {
        do {
            let response = try JSONDecoder().decode(R.self, from: data)
            completion?(response)
        } catch {
            completion?(nil)
        }
    }
    
    func getCity(completion: ((_ response: GetCityResponse?) -> Void)?) {
        sendRequest(fileName: .city, completion: completion)
    }
    
    func getWeather(completion: ((_ response: GetWeatherResponse?) -> Void)?) {
        sendRequest(fileName: .weather, completion: completion)
    }
}
