//
//  AppDelegate.swift
//  SmartFactory
//
//  Created by Sophie on 27.10.17.
//  Copyright © 2017 soet. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setLayout()
        return true
    }
    
    private func setLayout() {
        UINavigationBar.appearance().barTintColor = .darkBlue
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}

