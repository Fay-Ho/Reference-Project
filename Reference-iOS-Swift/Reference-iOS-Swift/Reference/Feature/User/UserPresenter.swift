//
//  UserPresenter.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

class UserPresenter {
    weak var viewController: UserViewControllerInterface?
}

extension UserPresenter: UserPresenterInterface {}
