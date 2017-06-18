//
//  AppDelegate.swift
//  Istanbul_app
//
//  Created by Иван Дю on 18.06.17.
//  Copyright © 2017 Matthew. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    var mainView = ViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        return true
    }
}

