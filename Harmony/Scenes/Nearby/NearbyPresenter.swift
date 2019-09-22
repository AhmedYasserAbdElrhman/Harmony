//
//  NearbyPresenter.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/29/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation

protocol NearbyViewPresenter {
  func viewWillAppear()
  var locationVerfier: LocationVerfier { set get }
}


class NearbyPresenterImplementation: NearbyViewPresenter {
  var locationVerfier: LocationVerfier = LocationVerfier()
  private var view: NearbyView!
  init(view: NearbyView) {
    self.view = view
  }
  
  
  func viewWillAppear() {
    locationVerfier.checkLocationServices() { status in
      switch status {
      case true:
        locationVerfier.checkLocationAuthorization {
          view.fetchSpotsOnMap(spots)
        }
      case false:
        view.settingsAlertMessage(title: "Turn om Location", message: "Turn on")
      }
    }

  }
    
  
}
