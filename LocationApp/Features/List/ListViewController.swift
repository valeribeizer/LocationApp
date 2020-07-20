//
//  ListViewController.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/15/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import MapKit


//  MARK: - Protocols
protocol ListViewControllerDelegate: class {
  func showNewPlace(location: CLLocation)
}

class ListViewController: UIViewController {
  //  MARK: - Variables
  var seaEye = CLLocationCoordinate2D(latitude: 49.197222, longitude: 20.070833)
  var stockholm = CLLocationCoordinate2D(latitude: 59.334591, longitude: 18.063240)
  var rome = CLLocationCoordinate2D(latitude: 41.902782, longitude: 12.496366)
  var amsterdam = CLLocationCoordinate2D(latitude: 52.370216, longitude: 4.895168)
  
  var coordinatesList: [CLLocationCoordinate2D] = []
  var delegate: ListViewControllerDelegate?
  
  //  MARK: - GUI Variables
  private (set) lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(LATableViewCell.self, forCellReuseIdentifier: LATableViewCell.reuseIdentifier)
    
    return tableView
  }()
  
  //  MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    self.navigationItem.title = NSLocalizedString("List", comment: "")
    
    self.coordinatesList.append(self.seaEye)
    self.coordinatesList.append(self.stockholm)
    self.coordinatesList.append(self.rome)
    self.coordinatesList.append(self.amsterdam)
    
    self.view.addSubview(self.tableView)
    
    self.setUpConstraints()
  }
  
  //  MARK: - Constraints
  private func setUpConstraints() {
    self.tableView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}


