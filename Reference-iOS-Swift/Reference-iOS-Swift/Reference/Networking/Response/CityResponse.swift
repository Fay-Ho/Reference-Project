//
//  CityResponse.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

struct CityResponse: Codable {
    let cities: [CityListResponse]
}

struct CityListResponse: Codable {
    let name: String
}
