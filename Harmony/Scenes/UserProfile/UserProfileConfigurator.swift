//
//  UserProfileConfigurator.swift
//  Harmony
//
//  Created by Ahmed Yasser on 9/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation

protocol UserProfileConfigurator {
  func configure(viewController: UserProfileViewController)
}

class UserProfileConfiguratorImplementation: UserProfileConfigurator {
  func configure(viewController: UserProfileViewController) {
    let presenter = UserProfilePresenterImplementation(view: viewController)
    viewController.presenter = presenter
  }
  
  
}
