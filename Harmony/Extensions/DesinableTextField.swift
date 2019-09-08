//
//  DesinableTextField.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/18/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class DesinableTextField: UITextField {
  @IBInspectable var leftImage: UIImage? {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  func updateView() {
    if let image = leftImage {
      leftViewMode = .always
      let imageView = UIImageView(frame: CGRect(x: 13, y: 0, width: 12, height: 13))
      imageView.image = image
      let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 18))
      view.addSubview(imageView)
      leftView = view
    } else {
      leftViewMode = .never
    }
    
  }
  
  
  
}
