//
//  WeatherPresenter.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

class WeatherPresenter {
    weak var viewController: WeatherViewControllerInterface?
}

extension WeatherPresenter: WeatherPresenterInterface {}
