//
//  SettingsViewController.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var interactor: SettingsInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsViewController: SettingsViewControllerInterface {}
