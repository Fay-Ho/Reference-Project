//
//  CityViewController.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    var interactor: CityInteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchData()
    }
}

extension CityViewController: CityViewControllerInterface {
    func undateSubviews(response: CityResponse) {
        print(response.cities[0].name)
    }
}
