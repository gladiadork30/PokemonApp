//
//  AppDelegate.swift
//  PokemonApp_UiKit
//
//  Created by Juan P on 28/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var globalNavigationController: UINavigationController?
    var rootNavigationController: UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        rootNavigationController = HomeWireFrame.createHomeModule()
        let navigationController = UINavigationController(rootViewController: rootNavigationController!)
        window = UIWindow(frame: UIScreen.main.bounds)
        globalNavigationController = navigationController
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }


}

