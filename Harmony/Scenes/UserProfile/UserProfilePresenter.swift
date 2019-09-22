//
//  UserProfilePresenter.swift
//  Harmony
//
//  Created by Ahmed Yasser on 9/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation

protocol UserProfilePresenter {
  
}

class UserProfilePresenterImplementation: UserProfilePresenter {
  private var view: UserProfileView?
  init(view: UserProfileView) {
    self.view = view
  }
}
