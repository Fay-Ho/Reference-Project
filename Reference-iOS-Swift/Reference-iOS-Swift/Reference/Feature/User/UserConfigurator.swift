//
//  UserConfigurator.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class UserConfigurator {
    func makeViewController() -> UIViewController {
        let interactor = UserInteractor()
        let presenter = UserPresenter()
        let viewController = UserViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}
