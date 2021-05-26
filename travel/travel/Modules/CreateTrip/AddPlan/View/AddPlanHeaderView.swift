//
//  TransportHeaderView.swift
//  travel
//
//  Created by Svetlana Safonova on 23.05.2021.
//

import UIKit

class AddPlanHeaderView: UITableViewHeaderFooterView {


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 30, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add Transport"
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImage = UIImage(systemName: "plus", withConfiguration: config)
        button.setImage(configImage, for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(addButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(15)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.leading.equalTo(titleLabel.snp.trailing).offset(10)
        }
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

