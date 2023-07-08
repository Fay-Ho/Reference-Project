//
//  HomeConfigurator.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class HomeConfigurator: FeatureConfigurator {
    func makeViewController() -> UIViewController {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let viewController = HomeViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}
