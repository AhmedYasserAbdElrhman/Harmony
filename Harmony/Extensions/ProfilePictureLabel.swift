//
//  ProfilePictureLabel.swift
//  Harmony
//
//  Created by Ahmed Yasser on 9/2/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class ProfilePictureLabel: UILabel {
  @IBInspectable var setupButton: Bool = false {
    didSet {
      setup()
    }
  }
  
  func setup() {
    switch setupButton {
    case true:
      self.backgroundColor = UIColor(red: 60/255, green: 179/255, blue: 113/255, alpha: 1)
      self.textAlignment = .center
      self.textColor = .white
      self.layer.cornerRadius = self.frame.size.height / 2
      self.layer.borderWidth = 3
      self.layer.borderColor = UIColor.white.cgColor
      self.layer.masksToBounds = true
      self.clipsToBounds = true
    default:
      break
    }
  }

}
