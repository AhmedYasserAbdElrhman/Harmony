//
//  MyTabBar.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/26/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    self.delegate = self
  }
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    if let nearbyVC = viewController as? NearbyViewController {
//      nearbyVC.delegate = MainViewController
    }
  }

}
