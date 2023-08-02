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
    private enum MockFile: String {
        case getCity = "city"
        case getWeather = "weather"
        case mockBundle = "Mock.bundle/"
        case jsonFile = "json"
    }
    
    private func sendRequest<R: Decodable>(fileName: MockFile, completion: ((_ response: R?) -> Void)?) {
        let jsonData = BundleProvider.loadFile(MockFile.mockBundle.rawValue + fileName.rawValue, type: MockFile.jsonFile.rawValue)
        guard let data = jsonData else { return }
        parseData(data: data, completion: completion)
    }
    
//    private func baseRequest() {
//        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=guangzhou&appid=9520804e734d81ed699abf203a13bd68&units=metric&lang=zh_cn") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request) { data, response, error in
//            do {
//                let json = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
//                print(json)
//            } catch {
//                print(error)
//            }
//        }
//        dataTask.resume()
//    }
    
    private func parseData<R: Decodable>(data: Data, completion: ((_ response: R?) -> Void)?) {
        do {
            let response = try JSONDecoder().decode(R.self, from: data)
            completion?(response)
        } catch {
            print(error)
            completion?(nil)
        }
    }
    
    func getCity(completion: ((_ response: CityResponse?) -> Void)?) {
        sendRequest(fileName: .getCity, completion: completion)
    }
    
    func getWeather(completion: ((_ response: WeatherResponse?) -> Void)?) {
        sendRequest(fileName: .getWeather, completion: completion)
    }
}
