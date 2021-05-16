//
//  LocationCell.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class LocationCell: UITableViewCell {


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        label.text = "New Plan"
        return label
    }()
    
    let addButton: UIButton = {
        let button = CustomAddButton()
        button.isUserInteractionEnabled = true
        button.setTitle("Location", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let view: UIImageView = {
        let view = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .small)
        let configImage = UIImage(systemName: "chevron.down", withConfiguration: config)
        view.image = configImage
        return view
    }()
    
    @objc func changeColorByPress(button: UIButton) {
        button.backgroundColor = CustomColors.buttonPressedPurple
        print("hi")
    }
    
    @objc func changeColorAfterPress(button: UIButton) {
        button.backgroundColor = CustomColors.buttonLightPurple
    }
    
    @objc func changeColorAfterPressAndDrag(button: UIButton) {
        button.backgroundColor = CustomColors.buttonPressedPurple
    }
    
    private func setupView() {
        contentView.isUserInteractionEnabled = false
        backgroundColor = .clear
        addButton.addTarget(self, action: #selector(changeColorByPress), for: .touchDown)
        addButton.addTarget(self, action: #selector(changeColorAfterPress), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(changeColorAfterPressAndDrag), for: .touchDragExit)
        addButton.addSubview(view)
        addSubview(titleLabel)
        addSubview(addButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(30)
            make.width.lessThanOrEqualTo(300)
            make.height.equalTo(45)
        }
        view.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(340)
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-20)
        }
    }

}
