//
//  LocationView.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class LocationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 24, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Starts"
        return label
    }()
    
    var locationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(CustomColors.whiteTitle, for: .normal)
        button.setTitleColor(CustomColors.nonSelectedWhite, for: .highlighted)
        button.setTitle("Location", for: .normal)
        return button
    }()
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(locationLabel)
        addSubview(locationButton)
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
            make.trailing.lessThanOrEqualToSuperview().offset(-50)
        }
        
        locationButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-35)
            make.width.equalTo(150)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    
}
