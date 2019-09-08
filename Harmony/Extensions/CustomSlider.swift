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
  
  private var sliderLabel = UILabel()
  
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
  
  func didSetFunc() -> UIImage {
    UIGraphicsBeginImageContext(thumbImage!.size)
    thumbImage?.draw(in: CGRect(origin: CGPoint.zero, size: thumbImage!.size))
    thumbHighlitedImage?.draw(in: CGRect(origin: CGPoint(x: 25, y: 15), size: thumbHighlitedImage!.size))
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
    
    
  }
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    super.beginTracking(touch, with: event)
    sliderLabel.removeFromSuperview()
    return true
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    self.addSubview(setupLabel(with: addTextOverSlider()))
  }
  
  func addTextUpSlider() {
    let sliderTrack = trackRect(forBounds: bounds)
    let sliderFrame = thumbRect(forBounds: bounds, trackRect: sliderTrack, value: value)
    self.addSubview(setupLabel(with: CGRect(x: sliderFrame.origin.x + 10, y: sliderFrame.origin.y - 10,width: 40,height: 15)))
  }
  
  func addTextOverSlider() -> CGRect {
    let sliderTrack = trackRect(forBounds: bounds)
    let sliderFrame = thumbRect(forBounds: bounds, trackRect: sliderTrack, value: value)
    return CGRect(x: sliderFrame.midX - 15, y: sliderFrame.midY - 10, width: 40, height: 15)
  }
  
  
  func setupLabel(with rect: CGRect) -> UIView {
    sliderLabel.text = "\(Int(value))"
    sliderLabel.textAlignment = .center
    sliderLabel.frame = rect
    sliderLabel.backgroundColor = .gray
    sliderLabel.textColor = .white
    return sliderLabel
  }

  
}
