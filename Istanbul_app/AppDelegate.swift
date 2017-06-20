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
        let navController = UINavigationController(rootViewController: mainView)
        window?.rootViewController = navController
        navController.navigationBar.barTintColor = UIColor(red: 160/255, green: 82/255, blue: 45/255, alpha: 1)
        window?.makeKeyAndVisible()
        return true
    }
}

