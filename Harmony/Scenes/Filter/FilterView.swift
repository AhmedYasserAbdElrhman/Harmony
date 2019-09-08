//
//  FilterViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/20/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class FilterView: UIView {
  
  private let sliderTextLabel: UILabel =  {
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
    sliderTextLabel.text = "\(Int(sliderBar.value))"
    self.addSubview(sliderTextLabel)
    sliderTextLabel.frame = sender.addTextUpSlider(slider: sender)
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

//    Bundle.main.loadNibNamed("FilterView", owner: self, options: nil)
//    guard let content = containerView else { return }
//    content.frame = self.bounds
//    content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//    self.addSubview(content)
//
  }
  
  
  private func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of:self))
    let nib = UINib(nibName: String(describing: type(of:self)), bundle: bundle)
    let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
    return nibView
  }

//  func changeTextLabelLocation(_ sender: CustomeSlider) {
//    sliderTextLabel.text = "\(Int(sliderBar.value))"
//    self.addSubview(sliderTextLabel)
//    sliderTextLabel.frame = sender.addTextOverSlider(slider: sender)
//  }
  
  
//  func setupFilterViewWithConstrains(_ view: UIView) {
//    self.addSubview(containerView)
////    self.translatesAutoresizingMaskIntoConstraints = false
////    self.frame = view.frame
////    UIView.animate(withDuration: 1.0,
////                   delay: 0.5,
////                   options: .curveEaseIn,
////                   animations: {
////                    view.layoutIfNeeded()
////    })
//    NSLayoutConstraint.activate([
//      self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
//      self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//      self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//      self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//      ])

//    view.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
//    view.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0))
//    view.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
//    view.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0))
    
  }

