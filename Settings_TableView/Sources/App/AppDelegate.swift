//
//  AppDelegate.swift
//  Settings_TableView
//
//  Created by Dmitriy Baskakov on 04.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationCaontroller = UINavigationController(rootViewController: ViewController())
        navigationCaontroller.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationCaontroller
        window?.makeKeyAndVisible()
        
        return true
    }
}

