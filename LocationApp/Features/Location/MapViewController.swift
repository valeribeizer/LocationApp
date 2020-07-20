//
//  MapViewController.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/15/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class MapViewController: UIViewController {
  //  MARK:  - Variables
  private var annotations: [LAPoint] = []
  var location: CLLocation?
  
  //  MARK: - GUI Variables
  private (set) lazy var mapView: MKMapView = {
    let view = MKMapView()
    view.delegate = self
    view.showsUserLocation = true
    
    return view
  }()
  
  //  MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .red
    self.navigationItem.title = NSLocalizedString("Map", comment: "")
    
    self.view.addSubview(self.mapView)
    self.mapView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    LocationManager.shared.getUsersLocation { [weak self] location in
      self?.annotations.append(LAPoint(
        title: "London",
        locationName: "England",
        coordinate: CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                           longitude: location.coordinate.longitude)))
      
      self?.mapView.setCenter(location.coordinate, animated: true)
      if let annotation = self?.annotations {
        self?.mapView.addAnnotations(annotation)
      }
    }
  }
  
  //  MARK: - Methods
  func openMapForPlace(latitude: Double, longitude: Double, placeName:String = "") {
    let latitude: CLLocationDegrees = latitude
    let longitude: CLLocationDegrees = longitude
    
    let regionDistance:CLLocationDistance = 100
    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
    let regionSpan = MKCoordinateRegion(center: coordinates,
                                        latitudinalMeters: regionDistance,
                                        longitudinalMeters: regionDistance)
    let options = [
      MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
      MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
    ]
    let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = placeName
    mapItem.openInMaps(launchOptions: options)
  }
}




