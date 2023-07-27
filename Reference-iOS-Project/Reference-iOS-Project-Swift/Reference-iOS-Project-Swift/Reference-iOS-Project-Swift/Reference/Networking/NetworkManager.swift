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
        case city = "get_city_list"
        case forecasts = "get_forecaste_weather"
        case lives = "get_lives_weather"
        case mockBundle = "Mock.bundle/"
        case jsonFile = "json"
    }
    
    private func sendRequest<R: Decodable>(fileName: MockFile, completion: ((_ response: R?) -> Void)?) {
        let jsonData = BundleProvider.loadFile(MockFile.mockBundle.rawValue + fileName.rawValue, type: MockFile.jsonFile.rawValue)
        guard let data = jsonData else { return }
        parseData(data: data, completion: completion)
    }
    
    private func baseRequest() {
        guard let url = URL(string: "https://restapi.amap.com/v3/weather/weatherInfo?city=440106&key=13b60d45154a4e2670df67a585752ce1&extensions=all") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            do {
                let json = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                print(json)
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
    
    private func parseData<R: Decodable>(data: Data, completion: ((_ response: R?) -> Void)?) {
        do {
            let response = try JSONDecoder().decode(R.self, from: data)
            completion?(response)
        } catch {
            completion?(nil)
        }
    }
    
    func getCityList(completion: ((_ response: GetCityListResponse?) -> Void)?) {
        sendRequest(fileName: .city, completion: completion)
    }
    
    func getLivesWeather(completion: ((_ response: GetLivesWeatherResponse?) -> Void)?) {
        sendRequest(fileName: .lives, completion: completion)
    }
}
