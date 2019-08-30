//
//  UserProfileViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/29/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

  @IBOutlet weak var myFavPlacesView: UIView!
  @IBOutlet weak var myReviewView: UIView!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentControl()
        setupContainerViews()
    }
  
  
  func setupSegmentControl() {
    segmentControl.removeAllSegments()
    segmentControl.insertSegment(withTitle: "My Fav Places", at: 0, animated: false)
    segmentControl.insertSegment(withTitle: "My Reviews", at: 1, animated: false)
    segmentControl.addTarget(self, action: #selector(segmentSwitchControl(_:)), for: .valueChanged)
    segmentControl.selectedSegmentIndex = 0
    
  }
  
  func updateView() {
    myFavPlacesView.isHidden = !(segmentControl.selectedSegmentIndex == 0)
    myReviewView.isHidden = (segmentControl.selectedSegmentIndex == 0)
  }
  
  func setupContainerViews() {
    myFavPlacesView = MyFavPlacesViewController().view
    myReviewView = MyReviewViewController().view
  }
  
  
  func addContainerViewAsChild(containerView: UIViewController) {
    addChild(containerView)
    view.addSubview(containerView.view)
    containerView.didMove(toParent: self)
  }
    
  @IBAction func segmentSwitchControl(_ sender: UISegmentedControl) {
    updateView()

  }
}
