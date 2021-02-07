//
//  AppDelegate.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/5/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupRootController()
        return true
    }
}
extension AppDelegate{
    //MARK:- Setup root view controller
    func setupRootController(){
        let rootViewController = MainViewController()
        let navController = UINavigationController(rootViewController: rootViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
}
