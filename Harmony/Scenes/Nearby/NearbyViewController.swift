//
//  NearbyViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/21/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import MapKit

class NearbyViewController: UIViewController {
  
  var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }
    

  @IBAction func filterButtonTapped(_ sender: UIBarButtonItem) {
    let storyBoard = UIStoryboard(name: "Main", bundle: .main)
    let filterView = storyBoard.instantiateViewController(withIdentifier: "Filter")
    self.addChild(filterView)
    self.view.addSubview(filterView.view)
    filterView.view.translatesAutoresizingMaskIntoConstraints = false
    filterView.view.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
    filterView.didMove(toParent: self)
  }
  
}
