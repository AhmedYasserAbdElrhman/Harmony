//
//  CustomBar.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class CustomBar: UITabBar {
  @IBInspectable var height: CGFloat = 0.0
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    var sizeThatFit = super.sizeThatFits(size)
    if height > 0.0 {
      sizeThatFit.height = height
    }
    return sizeThatFit
  }
}
