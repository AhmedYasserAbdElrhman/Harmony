//
//  CustomeSegment.swift
//  Harmony
//
//  Created by Ahmed Yasser on 9/2/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class CustomeSegment: UISegmentedControl {
  @IBInspectable var setupSegment: Bool = false {
    didSet {
      setup()
    }
  }
  
  
  func setup() {
    switch setupSegment {
    case true:
      self.backgroundColor = .white
      self.tintColor = .clear
      self.setWidth(200, forSegmentAt: 0)
      self.setWidth(200, forSegmentAt: 1)
      self.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "DINCondensed-Bold", size: 18) as Any,
                                   NSAttributedString.Key.foregroundColor: UIColor(red: 60/255, green: 179/255, blue: 113/255, alpha: 1)], for: .selected)
      self.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "DINCondensed-Bold", size: 18) as Any,
                                   NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)      
    default:
      break
    }
  }
  

}
