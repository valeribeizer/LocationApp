//
//  MapViewController+Ex.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/20/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import MapKit

extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    print(view)
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    guard let annotation = annotation  as? LAPoint else { return nil }
    
    let identifier = "Point"
    var view: MKMarkerAnnotationView
    
    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      view.glyphText = annotation.title
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    
    return view
  }
  
  func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
    guard let view = view as? MKMarkerAnnotationView,
      let annotation = view.annotation else { return }
    
    print(annotation.title)
    print(annotation.subtitle)
    
    print(annotation.coordinate.longitude)
    print(annotation.coordinate.latitude)
  }
}

extension MapViewController: ListViewControllerDelegate {
  func showNewPlace(location: CLLocation) {
    self.location = location
    
    LocationManager.shared.coordinates(location: location) { [weak self] (location) in
      guard let location = location else { return }
      self?.openMapForPlace(latitude: location.latitude, longitude: location.longitude)
    }
  }
}
