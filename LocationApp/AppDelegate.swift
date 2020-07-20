//
//  AppDelegate.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/15/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  //  MARK:  - Variables
  var window: UIWindow?
  
  //  MARK: - Methods
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    if let window = self.window {
      LAInterface.shared.setUpTabBar(window)
    }
    return true
  }
}

