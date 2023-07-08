//
//  NetworkManager.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import Foundation

class NetworkManager {
    private enum MockFile: String {
        case city = "get_city"
        case weather = "get_weather"
        case user = "post_user"
    }
    
    private func sendRequest<R: Decodable>(fileName: String, completion: ((_ response: R?) -> Void)?) {
        let jsonData = BundleProvider.loadJsonFile(fileName)
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
    
    func getCity(completion: ((_ response: CityResponse?) -> Void)?) {
        sendRequest(fileName: MockFile.city.rawValue, completion: completion)
    }
    
    func getWeather(completion: ((_ response: CityResponse?) -> Void)?) {
        sendRequest(fileName: MockFile.weather.rawValue, completion: completion)
    }
    
    func postUser(completion: ((_ response: CityResponse?) -> Void)?) {
        sendRequest(fileName: MockFile.user.rawValue, completion: completion)
    }
}
