//
//  UserProfileViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/29/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import SwiftCharts

class UserProfileViewController: UIViewController {

  @IBOutlet weak var chartView: UIView!
  @IBOutlet weak var myFavPlacesView: UIView!
  @IBOutlet weak var myReviewView: UIView!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  let buttonBar = UIView()

  
  override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentControl()
        updateView()
        setupChart()
    }
  
  
  func setupSegmentControl() {
    segmentControl.removeAllSegments()
    segmentControl.insertSegment(withTitle: "My Fav Places", at: 0, animated: false)
    segmentControl.insertSegment(withTitle: "My Reviews", at: 1, animated: false)
    setupButton()
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
  
  
  func setupChart() {
    let chartConfig = ChartConfigXY(
      xAxisConfig: ChartAxisConfig(from: 2, to: 14, by: 2),
      yAxisConfig: ChartAxisConfig(from: 0, to: 14, by: 2)
    )
    let chart = LineChart(frame: chartView.frame,
                          chartConfig: chartConfig,
                          xTitle: "X",
                          yTitle: "Y",
                          line: (chartPoints: [(2.0, 10.6), (4.2, 5.1), (7.3, 3.0), (8.1, 5.5), (14.0, 8.0)], color: UIColor.red))
    self.view.addSubview(chart.view)
    
  }
  
  
//  func addContainerViewAsChild(containerView: UIViewController) {
//    addChild(containerView)
//    view.addSubview(containerView.view)
//    containerView.didMove(toParent: self)
//  }
  
  
  func setupButton() {
    buttonBar.translatesAutoresizingMaskIntoConstraints = false
    buttonBar.backgroundColor = UIColor(red: 60/255, green: 179/255, blue: 113/255, alpha: 1)
    view.addSubview(buttonBar)
    buttonBar.topAnchor.constraint(equalTo: segmentControl.bottomAnchor).isActive = true
    buttonBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
    buttonBar.leftAnchor.constraint(equalTo: segmentControl.leftAnchor).isActive = true
    buttonBar.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)).isActive = true
    
    
    
  }

  @IBAction func segmentSwitchControl(_ sender: UISegmentedControl) {
    updateView()
    UIView.animate(withDuration: 0.3) {
      self.buttonBar.frame.origin.x = (self.segmentControl.frame.width / CGFloat(self.segmentControl.numberOfSegments)) * CGFloat(self.segmentControl.selectedSegmentIndex)
    }

  }
}
