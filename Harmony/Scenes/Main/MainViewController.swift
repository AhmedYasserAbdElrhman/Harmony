//
//  MainViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet var mainView: UIView!
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
        UIView.animate(withDuration: 1.0,
                       delay: 0.5,
                       options: .curveEaseIn,
                       animations: {
                        self.view.layoutIfNeeded()
//                        self.mainView.alpha = 0.1
                        
      })
    }
  
    @objc private func hideFilterMenu() {
        self.filterMenuOpen = false
        self.filterMenuConstrains.constant = -490
        UIView.animate(withDuration: 1.0,
                       delay: 0.5,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        
        })
    }
  }
