//
//  CityConfigurator.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class CityConfigurator: FeatureConfigurator {
    func makeViewController() -> UIViewController {
        let interactor = CityInteractor()
        let presenter = CityPresenter()
        let viewController = CityViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}
