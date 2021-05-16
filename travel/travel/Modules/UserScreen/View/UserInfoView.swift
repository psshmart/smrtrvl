//
//  UserInfoView.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit
import SnapKit

class UserInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tripsSegmentedControl: TripsSegmentedControl = {
        let control = TripsSegmentedControl(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 45), buttonTitles: ["My Trips", "Liked Trips"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 36, style: .bold)
        label.text = "Username"
        label.textAlignment = .center
        label.textColor = CustomColors.usernameGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImage = UIImage(systemName: "gearshape.fill", withConfiguration: config)
        button.setImage(configImage, for: .normal)
        
        button.tintColor = UIColor.white
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let userImage: UIImageView = {
        let view = UIImageView.init(frame: CGRect(x: 150, y: 150, width: 150, height: 150))
        view.clipsToBounds = true
        view.layer.cornerRadius = view.bounds.width/2
        view.backgroundColor = .black

        view.image = UIImage(named: "sasori")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    
    private func setupViews() {
        
        addSubview(tripsSegmentedControl)
        addSubview(usernameLabel)
        addSubview(settingsButton)
        addSubview(userImage)
    
        
        usernameLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(185)
            make.top.equalToSuperview().offset(self.bounds.height * 0.14)
            make.centerX.equalToSuperview()
        }
        
        settingsButton.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalToSuperview().offset(self.bounds.height * 0.066 + 32)
            make.leading.equalTo(usernameLabel.snp.trailing).offset(20)
            
        }
        
        userImage.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(150)
            make.top.equalTo(usernameLabel.snp.bottom)
                .offset(10)
            make.centerX.equalTo(usernameLabel)
        }
        
        tripsSegmentedControl.snp.makeConstraints { make in
            make.centerX.equalTo(userImage)
            make.width.equalTo(self.bounds.width * 0.367 * 2 + self.bounds.width * 0.145)
            make.height.equalTo(45)
            make.top.equalTo(userImage.snp.bottom).offset(30)
            make.bottom.equalToSuperview().offset(-14)
        }
        
    }
    
    
}
