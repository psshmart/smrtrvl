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
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 36, style: .bold)
        label.text = "Username"
        label.textAlignment = .center
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
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
    
    
    let tripsButton: UIButton = {
        let button = TripsButton()
        button.setTitle("My trips", for: .normal)
        button.backgroundColor = .clear
        button.layer.compositingFilter = .some("multiplyBlendMode")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    let likedTripsButton: UIButton = {
        let button = TripsButton()
        button.setTitle("Liked trips", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private func setupViews() {
        
        
        stackView.addArrangedSubview(tripsButton)
        stackView.addArrangedSubview(likedTripsButton)
        
        addSubview(stackView)
        addSubview(usernameLabel)
        addSubview(settingsButton)
        addSubview(userImage)
    
        
        usernameLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(185)
            make.top.equalToSuperview().offset(self.bounds.height * 0.07)
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
        
        stackView.snp.makeConstraints { make in
            make.width.equalTo(self.bounds.width * 0.367 * 2 + self.bounds.width * 0.145)
            make.height.equalTo(45)
            make.centerX.equalTo(userImage)
            make.top.equalTo(userImage.snp.bottom).offset(30)
            make.bottom.equalToSuperview().offset(-14)
        }
    }
}
