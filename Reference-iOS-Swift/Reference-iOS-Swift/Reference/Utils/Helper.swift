//
//  Helper.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/8.
//  Copyright © 2023 Fay. All rights reserved.
//

class Helper {
    let navigator: Navigator
    
    static let shared = Helper()
    private init() {
        navigator = Navigator()
    }
}
