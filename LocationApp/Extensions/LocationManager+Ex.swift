//
//  LocationManager+Ex.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/20/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension LocationManager: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if (status == .authorizedAlways || status == .authorizedWhenInUse) &&
      !self.locationUpdateListeners.isEmpty {
      self.locationManager.requestLocation()
    } else if status == .denied {
      self.sendUpdatedLocationsToListners()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
      self.lastUserLocation = location
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
    self.sendUpdatedLocationsToListners()
  }
}
