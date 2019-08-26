//
//  NearbyViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/21/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

protocol ContainerViewActionsDelgator: class {
  func toggleFilterMenu()
  func hideFilterMenu()
}

import UIKit
import MapKit

class NearbyViewController: UIViewController {
  
  weak var delegate: ContainerViewActionsDelgator!
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }
    

  @IBAction func filterButtonTapped(_ sender: UIBarButtonItem) {
    NotificationCenter.default.post(name: NSNotification.Name("ToggleFilterMenu"), object: nil)
  }
  
}
