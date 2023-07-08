//
//  UserInteractor.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

class UserInteractor {
    var presenter: UserPresenterInterface?
}

extension UserInteractor: UserInteractorInterface {}
