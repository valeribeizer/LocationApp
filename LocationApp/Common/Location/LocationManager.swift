//
//  LocationManager.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/16/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
  
  typealias ListnerHandler = (_ location: CLLocation) -> Void
  
  //  MARK: - Variables
  static let shared = LocationManager()
  
  var locationUpdateListeners: [ListnerHandler] = []
  var lastUserLocation: CLLocation? {
    didSet {
      self.sendUpdatedLocationsToListners()
    }
  }
  
  lazy var locationManager: CLLocationManager = {
    let manager =  CLLocationManager()
    manager.delegate = self
    
    return manager
  }()
  
  //  MARK: - Initialization
  private override init() {
    super.init()
    
    self.locationManager.requestWhenInUseAuthorization()
  }
  
  //  MARK: - Methods
  func getUsersLocation(successHandler: @escaping ListnerHandler) {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      self.locationUpdateListeners.append(successHandler)
    case .authorizedAlways, .authorizedWhenInUse:
      self.locationUpdateListeners.append(successHandler)
      self.locationManager.requestLocation()
    default:
      successHandler(CLLocation())
    }
  }
  
  func coordinates(location: CLLocation,
                   completion: @escaping (CLLocationCoordinate2D?) -> Void) {
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
      guard error == nil else {
        print("Geocoding error: \(error!)")
        completion(nil)
        return
      }
      completion(placemarks?.first?.location?.coordinate)
    }
  }
  
  func sendUpdatedLocationsToListners() {
    self.locationUpdateListeners.forEach { (handler) in
      handler(self.lastUserLocation ?? CLLocation())
    }
    self.locationUpdateListeners = []
  }
}



