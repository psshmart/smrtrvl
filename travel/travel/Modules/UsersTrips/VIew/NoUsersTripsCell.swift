//
//  NoUsersTripsCell.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

import UIKit

class NoUsersTripsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 23, style: .regular)
        label.text = "Users haven't published their trips yet"
        label.textColor = UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func setupView() {
        contentView.addSubview(nameLabel)
        selectionStyle = .none
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.greaterThanOrEqualTo(50)
        }
        
    }
}
