//
//  MainViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var filterMenuConstrains: NSLayoutConstraint!
  
  @IBInspectable var tableViewBackground: UIColor?
  
  var cellViewBackground: UIColor?
  var filterMenuOpen: Bool!
  var uiView: FilterView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableViewBackground()
  }
  
  func configureTableViewBackground( ){
    self.tableView.backgroundColor = tableViewBackground
    let blurEffect = UIBlurEffect(style: .extraLight)
    let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
    blurVisualEffectView.frame = self.view.frame
    self.tableView.backgroundView = blurVisualEffectView
    cellViewBackground = blurVisualEffectView.backgroundColor
    
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MainTableViewCell
    cell!.cellImage.image = UIImage(named: "place1")
    cell?.backgroundColor = cellViewBackground
    cell?.hideSperatorLines()
    cell!.titleLabel.text = "Great Design Lets Test"
    return cell!
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250.0
  }
  
  @IBAction func filterButtonTapped(_ sender: Any) {
    uiView = FilterView(frame: CGRect(x: 0, y: -450, width: self.view.frame.width, height: self.view.frame.height/2))
    uiView.delegate = self
    self.view.bringSubviewToFront(uiView)
    
    self.view.addSubview(uiView)
    UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn, animations: {
      self.uiView.frame.origin = CGPoint(x: 0, y: 0)
      }, completion: nil)
    
  }
  
}

extension MainViewController: FilterViewProtocol{
  func cancelButton() {
    UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
      self.uiView.frame.origin = CGPoint(x: 0, y: -450)
    }, completion: { _ in
      self.uiView.removeFromSuperview()
    })
  }

}
