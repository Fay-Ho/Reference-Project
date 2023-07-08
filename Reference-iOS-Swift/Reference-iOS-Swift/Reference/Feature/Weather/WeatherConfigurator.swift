//
//  WeatherConfigurator.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class WeatherConfigurator {
    func makeViewController() -> UIViewController {
        let interactor = WeatherInteractor()
        let presenter = WeatherPresenter()
        let viewController = WeatherViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}
