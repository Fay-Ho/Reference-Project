//
//  AppDelegate.swift
//  Reference-iOS-Project-Swift
//
//  Created by Fay on 2023/7/14.
//  Copyright © 2023 Fay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Helper.shared.navigator.makeNavigation(destination: .weather)
        window?.makeKeyAndVisible()
        return true
    }
}
