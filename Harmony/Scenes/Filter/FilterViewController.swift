//
//  FilterViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class FilterViewController: UIView {
  
  private let sliderTextLabel = UILabel()
  
  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet weak var sliderBar: CustomeSlider!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    commonInit()
  }
  
  
  
  
  @IBAction func cancelFilterButtonTapped(_ sender: Any) {
  }
  
  @IBAction func sliderMoving(_ sender: CustomeSlider) {
    sliderTextLabel.text = "\(Int(sliderBar.value))"
    self.addSubview(sliderTextLabel)
    sliderTextLabel.frame = sender.addTextUpSlider(slider: sender)
  }
  
  private func customizeLabel() {
    sliderTextLabel.backgroundColor = .gray
    sliderTextLabel.textAlignment = .center
  }
  
  
  private func commonInit() {
    Bundle.main.loadNibNamed("FilterView", owner: self, options: nil)
    setupFilterViewWithConstrains(self)
  
  }
  
  func changeTextLabelLocation(_ sender: CustomeSlider) {
    sliderTextLabel.text = "\(Int(sliderBar.value))"
    self.addSubview(sliderTextLabel)
    sliderTextLabel.frame = sender.addTextOverSlider(slider: sender)
  }
  
  
  func setupFilterViewWithConstrains(_ view: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.frame = view.frame
    view.addSubview(containerView)
    UIView.animate(withDuration: 1.0,
                   delay: 0.5,
                   options: .curveEaseIn,
                   animations: {
                    view.layoutIfNeeded()
    })
    view.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
    view.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0))
    view.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
    view.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0))
    
  }
}
