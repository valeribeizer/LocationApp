//
//  LAPoint.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/17/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import Foundation
import MapKit

class LAPoint: NSObject, MKAnnotation {
  
  var title: String?
  var locationName: String?
  var coordinate: CLLocationCoordinate2D
  
  init(title: String, locationName: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.locationName = locationName
    self.coordinate = coordinate
  }
  
  var subtitle: String? {
    return locationName
  }
}
