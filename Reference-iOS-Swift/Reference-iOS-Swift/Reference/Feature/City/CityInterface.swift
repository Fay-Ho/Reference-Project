//
//  CityInterface.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import Foundation

protocol CityInteractorInterface {
    func fetchData()
}

protocol CityPresenterInterface {
    func handle(response: CityResponse)
}

protocol CityViewControllerInterface: NSObject {
    func undateSubviews(response: CityResponse)
}
