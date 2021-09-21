//
//  AppDelegate.swift
//  NavigatorPattern
//
//  Created by Асанцев Владимир Дмитриевич on 07.09.2021.
//

/*
 (1) создается объект MainNavigator
 */

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = MainNavigator.shared.window // (1)
        return true
    }

}

