//
//  Navigator.swift
//  Reference-iOS-Swift
//
//  Created by Fay on 2023/7/7.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

class Navigator {
    enum Destination {
        case city
        case home
        case settings
        case user
    }
    
    private var configurators: [Destination: FeatureConfigurator] {
        get {
            [
                .city: CityConfigurator(),
                .home: HomeConfigurator(),
                .settings: SettingsConfigurator(),
                .user: UserConfigurator()
            ]
        }
    }
    
    func navigate<P: Codable>(to: Destination, params: P) {
        
    }
}
