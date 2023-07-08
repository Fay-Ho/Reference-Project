//
//  UserViewController.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var interactor: UserInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UserViewController: UserViewControllerInterface {}
