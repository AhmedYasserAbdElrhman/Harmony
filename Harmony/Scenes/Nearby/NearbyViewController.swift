//
//  NearbyViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/21/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import MapKit

protocol NearbyView {
  func settingsAlertMessage(title: String, message: String)
}


class NearbyViewController: UIViewController, CLLocationManagerDelegate {
  
  private var configurator: NearbyConfigurator = NearbyConfiguratorImplementation()
  let locationVerfier = LocationVerfier()
  let spots = [Spot(spotName: "Swifty Camp", lattitude: 30.0540201, longtitude: 31.1992786),
                  Spot(spotName: "Dumiat ❤️", lattitude: 31.41648, longtitude: 31.81332),
                  Spot(spotName: "FCIS", lattitude: 31.0416496, longtitude: 31.3543316),
                  Spot(spotName: "Sheikh Zayed", lattitude: 30.0485037, longtitude: 30.9567807),
                  Spot(spotName: "Ras ELbar 🖤", lattitude: 31.5123677, longtitude: 31.8164931),
                  Spot(spotName: "Hilton Shark's Bay", lattitude: 27.9654494, longtitude: 34.3980624),
                  Spot(spotName: "Cairo", lattitude: 30.0444, longtitude: 31.2357)]
  @IBOutlet private weak var mapView: MKMapView!
  var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
      locationVerfier.checkLocationServices() { settingsAlertMessage(title: "Turn on Location", message: "Turn on")}
      locationVerfier.checkLocationAuthorization {fetchSpotsOnMap(spots) }
      locationVerfier.locationManger.delegate = self
      

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
  
  
  func fetchSpotsOnMap(_ spot: [Spot]) {
    for spot in spots {
      let annotations = MKPointAnnotation()
      annotations.title = spot.spotName
      annotations.coordinate = CLLocationCoordinate2D(latitude:
      spot.lattitude, longitude: spot.longtitude)
      mapView.addAnnotation(annotations)
    }
  }

  
}
