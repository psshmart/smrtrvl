//
//  UsersTripsCell.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

import UIKit
import SnapKit

class UsersTripsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isLiked: Bool = false
    
    var backView: UIView = {
        let view = UIView(frame: CGRect(x: 27, y: 0, width: 364, height: 120))
        view.layer.backgroundColor = CustomColors.nonSelectedViewPurple.cgColor
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        return view
    }()
    
    let profileImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        view.layer.cornerRadius = view.bounds.width/2
        view.backgroundColor = .black
        
        return view
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30))
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = CustomColors.yellowLable
        return button
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 18, style: .regular)
        label.textColor = UIColor(red: 70/255, green: 72/255, blue: 84/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "username"
        
        return label
    }()
    
    let tripNameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 34, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()
    
    private func setupView() {
        contentView.addSubview(backView)
        backView.addSubview(profileImageView)
        backView.addSubview(usernameLabel)
        backView.addSubview(tripNameLabel)
        backView.addSubview(likeButton)
        selectionStyle = .none
        
        backView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(364)
            make.height.equalTo(120)
            make.top.equalToSuperview().offset(5)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.leading.equalToSuperview().offset(19)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.leading.equalTo(profileImageView.snp.trailing).offset(1)
            make.width.greaterThanOrEqualTo(120)
            make.height.equalTo(23)
        }
        
        tripNameLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(114)
            make.height.equalTo(43)
            make.top.equalTo(usernameLabel.snp.bottom).offset(25)
            make.trailing.equalToSuperview().offset(-33)
        }
        
    }
    
}
