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
        case settings
        case user
        case weather
    }
    
    func navigate<P: Codable>(to: Destination, params: P) {
        
    }
    
    func distinations() -> [Destination: UIViewController] {
        [.city: CityConfigurator().makeViewController()]
    }
}
