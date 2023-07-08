//
//  SettingsConfigurator.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class SettingsConfigurator {
    func makeViewController() -> UIViewController {
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter()
        let viewController = SettingsViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}
