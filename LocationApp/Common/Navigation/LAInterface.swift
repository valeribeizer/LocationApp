//
//  LAInterface.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/15/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit

class LAInterface {
  //  MARK: - Variables
  static let shared = LAInterface()
  
  //  MARK: - GUI Variables
  private lazy var tabBar: UITabBarController = {
    let tabBar = UITabBarController()
    tabBar.tabBar.barTintColor = .white
    tabBar.tabBar.tintColor = .systemBlue
    
    return tabBar
  }()
  
  private lazy var mapBarItem: UITabBarItem = {
    let item = UITabBarItem(title: NSLocalizedString("Map", comment: ""),
                            image: UIImage(systemName: "map"),
                            selectedImage: UIImage(systemName: "map.fill"))
    
    return item
  }()
  
  private lazy var listBarItem: UITabBarItem = {
    let item = UITabBarItem(title: NSLocalizedString("List", comment: ""),
                            image: UIImage(systemName: "list.bullet"),
                            selectedImage: nil)
    
    return item
  }()
  
  private lazy var settingsBarItem: UITabBarItem = {
    let item = UITabBarItem(title: NSLocalizedString("Settings", comment: ""),
                            image: UIImage(systemName: "gear"),
                            selectedImage: nil)
    
    return item
  }()
  
  //  MARK: - Initialization
  private init() { }
  
  //  MARK: - Methods
  func setUpNavigationBar(_ window: UIWindow) {
    let navigationController = UINavigationController()
    navigationController.viewControllers = [MapViewController()]
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  func setUpTabBar(_ window: UIWindow) {
    let mapController = MapViewController()
    mapController.tabBarItem = self.mapBarItem
    
    let listController = ListViewController()
    listController.tabBarItem = self.listBarItem
    
    let settingsController = SettingsViewController()
    settingsController.tabBarItem = self.settingsBarItem
    
    let viewControllers = [mapController,
                           listController,
                           settingsController].map { UINavigationController(rootViewController: $0) }
    self.tabBar.viewControllers = viewControllers
    window.rootViewController = self.tabBar
    window.makeKeyAndVisible()
  }
}
