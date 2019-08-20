//
//  MainViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var filterMenuConstrains: NSLayoutConstraint!
  var filterMenuOpen: Bool!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    NotificationCenter.default.addObserver(self,
                                           selector: #selector(hideFilterMenu),
                                           name: NSNotification.Name("HideFilterMenu"),
                                           object: nil)
    }
  
  
  @IBAction func filterButtonTapped(_ sender: Any) {
    toggleFilterMenu()
    
  }
  
    
  
  
  
  
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MainTableViewCell
      cell!.cellImage.image = UIImage(named: "icon")
      cell!.titleLabel.text = "Great Design Lets Test"
      return cell!
    }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250.0
  }
  
  
  private func toggleFilterMenu() {
      self.filterMenuOpen = true
      self.filterMenuConstrains.constant = 0
  }
  
  @objc private func hideFilterMenu() {
      self.filterMenuOpen = false
      self.filterMenuConstrains.constant = -490
  }


    

}
