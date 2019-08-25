//
//  CustomSlider.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class CustomeSlider: UISlider {
  @IBInspectable var thumbImage: UIImage? {
    didSet {
      setThumbImage(thumbImage, for: .normal)
    }
  }
  
  @IBInspectable var thumbHighlitedImage: UIImage? {
    didSet {
      setThumbImage(didSetFunc(), for: .highlighted)
    }
  }
  
  
  // Changing size of the slider thumb !!
  
  func didSetFunc() -> UIImage {
      UIGraphicsBeginImageContext(thumbImage!.size)
      thumbImage?.draw(in: CGRect(origin: CGPoint.zero, size: thumbImage!.size))
      thumbHighlitedImage?.draw(in: CGRect(origin: CGPoint(x: 25, y: 15), size: thumbHighlitedImage!.size))
      let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
      UIGraphicsEndImageContext()
      return newImage
    
  
  }
  
}
