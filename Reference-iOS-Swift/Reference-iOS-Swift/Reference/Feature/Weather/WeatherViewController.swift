//
//  WeatherViewController.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var interactor: WeatherInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WeatherViewController: WeatherViewControllerInterface {}
