//
//  LocationVerfier.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/28/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import MapKit

class LocationVerfier {

  let locationManger = CLLocationManager()


  func checkLocationServices(completion: () -> Void)  {
    if CLLocationManager.locationServicesEnabled() {
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse, .authorizedAlways:
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.startUpdatingLocation()
        completion()
      case .denied:
        locationManger.requestAlwaysAuthorization()
      case .restricted:
        break
      case .notDetermined:
        locationManger.requestAlwaysAuthorization()
      }
    } else {
      print("Turn Location Service")
    }
  }
  
   func checkLocationAuthorization() {
  }
  
  

}
