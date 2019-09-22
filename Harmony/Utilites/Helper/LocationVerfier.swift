//
//  LocationVerfier.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/28/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import CoreLocation

class LocationVerfier {
    
  let locationManger = CLLocationManager()


  func checkLocationServices(closure: (Bool) -> ()) {
    closure(CLLocationManager.locationServicesEnabled())
    
  }
  
  func checkLocationAuthorization(completion: () -> Void) {
    switch CLLocationManager.authorizationStatus() {
    case .authorizedWhenInUse, .authorizedAlways:
      locationManger.startUpdatingLocation()
      completion()
    case .denied:
      break
    case .restricted:
      break
    case .notDetermined:
      locationManger.requestAlwaysAuthorization()
    }

  }
  
  
  func setupLocationManger() {
    locationManger.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  

}

extension NearbyViewController: NearbyView {
  
  func settingsAlertMessage(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let settingsAction = UIAlertAction(title: "Settings", style: .default) { (UIAlertAction) in
      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)! as URL, options: [:], completionHandler: nil)
    }
    
    alertController.addAction(cancelAction)
    alertController.addAction(settingsAction)
    self.present(alertController, animated: true, completion: nil)

  }
}
