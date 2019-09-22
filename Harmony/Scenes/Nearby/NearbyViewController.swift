//
//  NearbyViewController.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/21/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import MapKit

let spots = [Spot(spotName: "Swifty Camp", lattitude: 30.0540201, longtitude: 31.1992786),
             Spot(spotName: "Dumiat ❤️", lattitude: 31.41648, longtitude: 31.81332),
             Spot(spotName: "FCIS", lattitude: 31.0416496, longtitude: 31.3543316),
             Spot(spotName: "Sheikh Zayed", lattitude: 30.0485037, longtitude: 30.9567807),
             Spot(spotName: "Ras ELbar 🖤", lattitude: 31.5123677, longtitude: 31.8164931),
             Spot(spotName: "Hilton Shark's Bay", lattitude: 27.9654494, longtitude: 34.3980624),
             Spot(spotName: "Cairo", lattitude: 30.0444, longtitude: 31.2357)]


protocol NearbyView {
  func settingsAlertMessage(title: String, message: String)
  func fetchSpotsOnMap(_ spots: [Spot])
}


class NearbyViewController: UIViewController, CLLocationManagerDelegate {
  
  private var configurator: NearbyConfigurator = NearbyConfiguratorImplementation()
  var presenter: NearbyViewPresenter!
  @IBOutlet private weak var mapView: MKMapView!
  var containerView: UIView!
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      configurator.configure(viewController: self)
      presenter.locationVerfier.locationManger.delegate = self
      fetchLocationOnMap()
    }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedAlways, .authorizedWhenInUse:
      fetchSpotsOnMap(spots)
    default:
      break
    }
  }
  

  @IBAction func filterButtonTapped(_ sender: UIBarButtonItem) {
    let uiView = FilterView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2))
    let currentWindow: UIWindow? = UIApplication.shared.keyWindow
    currentWindow?.addSubview(uiView)

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
  
  func fetchLocationOnMap() {
    let location = CLLocationCoordinate2D(latitude: spots[0].lattitude, longitude: spots[0].longtitude)
    let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    mapView.setRegion(region, animated: true)
  }
  
  
  @IBAction func addNewSPotButton(_ sender: UIButton) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "AddNewSpotViewController")
    self.present(controller, animated: true, completion: nil)

  }
  
  
}
