//
//  FilterViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
  private let sliderTextLabel = UILabel()
  //How to set label over and upove the slider thumb !!
  
  @IBOutlet weak var sliderBar: UISlider!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    customizeLabel()
    
  }
  
  @IBAction func cancelFilterButtonTapped(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name("HideFilterMenu"), object: nil)
  }
  
  @IBAction func sliderMoving(_ sender: CustomeSlider) {
    sliderTextLabel.text = "\(Int(sliderBar.value))"
    self.view.addSubview(sliderTextLabel)
    sliderTextLabel.frame = addTextOverSlider(slider: sender)
  }
  //  @IBAction func touchEnd(_ sender: CustomeSlider) {
  //    let sliderTrack = sliderBar.trackRect(forBounds: sliderBar.bounds)
  //    let sliderFrame = sliderBar.thumbRect(forBounds: sliderBar.bounds, trackRect: sliderTrack, value: sliderBar.value)
  //    let point = CGPoint(x: sliderFrame.origin.x + sliderBar.frame.origin.x, y: sliderBar.frame.origin.y)
  //    self.view.addSubview(sliderTextLabel)
  //    sliderTextLabel.frame = CGRect(origin: point, size: CGSize(width: 20, height: 20))
  //
  //  }
  
  
  func addTextOverSlider(slider: CustomeSlider) -> CGRect {
    let sliderTrack = slider.trackRect(forBounds: slider.bounds)
    let sliderFrame = slider.thumbRect(forBounds: slider.bounds, trackRect: sliderTrack, value: slider.value)
    return CGRect(x: sliderFrame.origin.x + slider.frame.origin.x + 15 , y: slider.frame.origin.y - 25 ,width: 40,height: 15)
  }
  
  private func customizeLabel() {
    sliderTextLabel.backgroundColor = .gray
    sliderTextLabel.textAlignment = .center
  }
  
  
  
}
