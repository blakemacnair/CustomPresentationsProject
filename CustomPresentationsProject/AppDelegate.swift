//
//  AppDelegate.swift
//  DeckAnimation
//
//  Created by Blake Macnair on 12/21/18.
//  Copyright © 2018 Macnair. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let baseVC = ViewController()
        let navVC = UINavigationController(rootViewController: baseVC)

        window!.rootViewController = navVC
        window!.makeKeyAndVisible()
        return true
    }

}

