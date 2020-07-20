//
//  SettingsViewController.swift
//  LocationApp
//
//  Created by Valeryia Beizer on 7/18/20.
//  Copyright © 2020 Valeryia Beizer. All rights reserved.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
  //  MARK: - Variables
  let labelName: String = "Press button and go to settings"
  let buttonName: String = "Settings"
  let imageName: String = "arrowImage"
  let radius: CGFloat = 10
  
  //  MARK: - GUI Variables
  private (set) lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.text = self.labelName
    label.textColor = .lightGray
    label.numberOfLines = 0
    
    return label
  }()
  
  private (set) lazy var arrowImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: self.imageName)
    image.alpha = 0.25
    image.contentMode = .scaleAspectFill
    
    return image
  }()
  
  private (set) lazy var settingsButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemBlue
    button.setTitle(self.buttonName, for: .normal)
    button.tintColor = UIColor.white
    button.addTarget(self,
                     action: #selector(settingsButtonTapped),
                     for: .touchUpInside)
    button.layer.masksToBounds = true
    button.layer.cornerRadius = self.radius
    
    return button
  }()
  
  //  MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    self.navigationItem.title = NSLocalizedString("Settings", comment: "")
    
    self.view.addSubview(self.settingsButton)
    self.view.addSubview(self.infoLabel)
    self.view.addSubview(self.arrowImage)
    self.setUpConstraints()
  }
  
  //  MARK: - Actions
  @objc private func settingsButtonTapped() {
    guard let settingsURL = URL(string: UIApplication.openSettingsURLString),
      UIApplication.shared.canOpenURL(settingsURL) else { return }
    UIApplication.shared.open(settingsURL, completionHandler: nil)
  }
  
  //  MARK: - Constraints
  private func setUpConstraints() {
    self.settingsButton.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview().inset(20)
      make.bottom.equalToSuperview().inset(100)
      make.height.equalTo(50)
    }
    self.infoLabel.snp.makeConstraints { (make) in
      make.top.equalToSuperview().inset(350)
      make.centerX.equalToSuperview()
    }
    self.arrowImage.snp.makeConstraints { (make) in
      make.top.equalTo(self.infoLabel.snp.bottom).offset(40)
      make.centerX.equalToSuperview()
      make.height.equalTo(300)
      make.width.equalTo(200)
    }
  }
}
