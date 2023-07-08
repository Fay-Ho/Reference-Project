//
//  WeatherResponse.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

struct WeatherResponse {
    let lives: [WeatherLiveResponse]
    let status: String
}

struct WeatherLiveResponse {
    let city: String
    let province: String
}
