//
//  CityPresenter.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

class CityPresenter {
    weak var viewController: CityViewControllerInterface?
}

extension CityPresenter: CityPresenterInterface {
    func handle(response: GetCityResponse) {
        viewController?.undateSubviews(response: response)
    }
}
