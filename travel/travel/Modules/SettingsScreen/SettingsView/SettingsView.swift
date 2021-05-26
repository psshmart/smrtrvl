//
//  SettingsView.swift
//  travel
//
//  Created by Svetlana Safonova on 27.05.2021.
//

import UIKit

class SettingsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var editProfileButton: CustomAddButton = {
        let button = CustomAddButton()
        button.setTitle("Edit Profile", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.backgroundColor = CustomColors.selectedViewPurple
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var logoutButton: CustomAddButton = {
        let button = CustomAddButton()
        button.setTitle("Log Out", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.backgroundColor = CustomColors.selectedViewPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(editProfileButton)
        stackView.addArrangedSubview(logoutButton)
        
        
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        editProfileButton.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(57)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(57)
        }
    }
    
}
