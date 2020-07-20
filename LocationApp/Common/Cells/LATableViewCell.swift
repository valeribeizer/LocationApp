//
//  LATableViewCell.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/18/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class LATableViewCell: UITableViewCell {
//  MARK: - Variables
  static let reuseIdentifier = "LACell"
  let fontSize: CGFloat = 20
  let fontSizeName: CGFloat = 15
  let nameOfFont: String = "Apple SD Gothic Neo"
  
//  MARK: - GUI Variables
  private (set) lazy var latitudeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: self.nameOfFont, size: self.fontSize)
    
    return label
  }()
  
  private (set) lazy var longitudeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: self.nameOfFont, size: self.fontSize)
    label.textColor = UIColor.systemBlue
    
    return label
  }()
  
//  MARK: - Initializatin
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.initView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func initView() {
    self.addSubview(self.latitudeLabel)
    self.addSubview(self.longitudeLabel)
    self.setUpConstraints()
  }
  
//  MARK: - Constarints
  private func setUpConstraints() {
    self.latitudeLabel.snp.makeConstraints { (make) in
      make.top.equalToSuperview().inset(10)
      make.left.equalToSuperview().inset(20)
    }
    self.longitudeLabel.snp.makeConstraints { (make) in
      make.top.equalTo(self.latitudeLabel.snp.bottom).offset(10)
      make.left.equalToSuperview().inset(20)
      make.bottom.equalToSuperview().inset(10)
    }
  }
  
//  MARK: - Methods
  func setUpCell(latitude: String, longitude: String) {
    self.latitudeLabel.text = latitude
    self.longitudeLabel.text = longitude
    
    self.setNeedsUpdateConstraints()
  }
}
