//
//  ProfilePictureView.swift
//  Harmony
//
//  Created by Ahmed Yasser on 9/2/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class ProfilePictureView: UIImageView {
  @IBInspectable var cornerRaduis: Bool = false {
    didSet {
      setup()
    }
  }

    func setup() {
    switch cornerRaduis {
    case true:
      self.layer.cornerRadius = self.frame.size.height / 2
    default:
      self.layer.cornerRadius = 0
    }
  }
  

  


}
