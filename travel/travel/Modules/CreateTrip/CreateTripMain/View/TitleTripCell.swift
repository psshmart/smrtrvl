//
//  MainInfoCell.swift
//  travel
//
//  Created by Svetlana Safonova on 15.05.2021.
//

import UIKit
import SnapKit

class TitleTripCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var isPrivate: Bool = true
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 30, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        return label
    }()
    
    let privacyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImage = UIImage(systemName: "eye", withConfiguration: config)
        button.setImage(configImage, for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let titleTextField: UITextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private func setupView() {
        backgroundColor = .clear
        
        privacyButton.addTarget(self, action: #selector(changePrivacy), for: .touchUpInside)
        contentView.isUserInteractionEnabled = false
        addSubview(titleLabel)
        addSubview(privacyButton)
        addSubview(titleTextField)
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(30)
            make.width.lessThanOrEqualTo(100)
            make.height.equalTo(35)
        }
        
        privacyButton.snp.makeConstraints { make in
            //make.top.equalToSuperview().offset(20)
            make.centerY.equalTo(titleLabel)
            make.leading.equalTo(titleLabel.snp.trailing).offset(20)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(28)
            make.width.equalTo(340)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    @objc func changePrivacy(button: UIButton) {
        self.isPrivate = !isPrivate
        if isPrivate {
            let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
            let configImage = UIImage(systemName: "eye.slash", withConfiguration: config)
            button.setImage(configImage, for: .normal)
        } else {
            let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
            let configImage = UIImage(systemName: "eye", withConfiguration: config)
            button.setImage(configImage, for: .normal)
        }
    }
}
