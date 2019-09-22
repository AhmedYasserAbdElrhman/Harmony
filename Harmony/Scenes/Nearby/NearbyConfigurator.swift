//
//  NearbyConfigurator.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/29/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation

protocol NearbyConfigurator {
  func configure(viewController: NearbyViewController)
}

class NearbyConfiguratorImplementation: NearbyConfigurator {
  func configure(viewController: NearbyViewController) {
    let presenter = NearbyPresenterImplementation(view: viewController)
    viewController.presenter = presenter
    
  }
  
  
}
