//
//  FilterViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class FilterView: UIView {
  
  private var sliderTextLabel: UILabel =  {
    let lbl = UILabel()
    lbl.textAlignment = .center
    lbl.backgroundColor = .gray
    return lbl
  }()

  
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
    self.removeFromSuperview()
  }
  
  @IBAction func sliderMoving(_ sender: CustomeSlider) {
    sender.addTextUpSlider()
  }
  
  @IBAction func sliderStartMoving(_ sender: CustomeSlider) {
    sliderTextLabel.removeFromSuperview()
  }
  
  private func customizeLabel() {
    sliderTextLabel.backgroundColor = .gray
    sliderTextLabel.textAlignment = .center
  }
  

  
  
  private func commonInit() {
    
    backgroundColor = .clear
    
    containerView = loadViewFromNib()
    containerView.frame = bounds
    containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    containerView.translatesAutoresizingMaskIntoConstraints = true
    
    addSubview(containerView)
  }
  
  
  private func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of:self))
    let nib = UINib(nibName: String(describing: type(of:self)), bundle: bundle)
    let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
    return nibView
  }
  }

