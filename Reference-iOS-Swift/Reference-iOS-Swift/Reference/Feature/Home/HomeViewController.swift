//
//  HomeViewController.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var interactor: HomeInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController {}

extension HomeViewController: HomeViewControllerInterface {}
