//
//  MainViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/19/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

@IBDesignable
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var filterMenuConstrains: NSLayoutConstraint!
  
  @IBInspectable var tableViewBackground: UIColor?
  var filterMenuOpen: Bool!
  
  override func viewDidLoad() {
        super.viewDidLoad()
//    self.tableView.backgroundColor = tableViewBackground
    configureTableViewBackground()
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(hideFilterMenu),
                                           name: NSNotification.Name("HideFilterMenu"),
                                           object: nil)
    }
  
  // After adding TabBarController tableviewBackground not working !!!
  func configureTableViewBackground( ){
    self.tableView.backgroundColor = tableViewBackground
    let blurEffect = UIBlurEffect(style: .extraLight)
    let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
    blurVisualEffectView.frame = self.view.frame
    self.tableView.backgroundView = blurVisualEffectView

  }
  
  
    @IBAction func filterButtonTapped(_ sender: Any) {
      toggleFilterMenu()
      
    }
  
    
  
  
  
  
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MainTableViewCell
      cell!.cellImage.image = UIImage(named: "place1")
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
//                        self.view.alpha = 0.1
                        
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
