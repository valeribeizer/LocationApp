//
//  ListViewController+Ex.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/20/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import MapKit

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.coordinatesList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: LATableViewCell.reuseIdentifier,
                                                  for: indexPath)
    let latitude = String(self.coordinatesList[indexPath.row].latitude)
    let longitude = String(self.coordinatesList[indexPath.row].longitude)
    (cell as? LATableViewCell)?.setUpCell(latitude: latitude, longitude: longitude)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.tableView.deselectRow(at: indexPath, animated: true)
    self.delegate = MapViewController()
    
    let latitude: CLLocationDegrees = self.coordinatesList[indexPath.row].latitude
    let longitude: CLLocationDegrees = self.coordinatesList[indexPath.row].longitude
    
    let location: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
    self.delegate?.showNewPlace(location: location)
  }
}
