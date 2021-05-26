//
//  MyTripsView.swift
//  travel
//
//  Created by Svetlana Safonova on 27.03.2021.
//

import UIKit
import SnapKit

class MyTripsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backView: UIView = {
        let view = UIView(frame: CGRect(x: 27, y: 0, width: 364, height: 180))
        view.layer.backgroundColor = CustomColors.nonSelectedViewPurple.cgColor
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        return view
    }()
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 26, style: .regular)
        label.text = "Trip Name"
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 16, style: .regular)
        label.text = "date"
        label.textColor = CustomColors.nonSelectedWhite
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(backView)
        backView.addSubview(nameLabel)
        backView.addSubview(dateLabel)
        
        backView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(364)
            make.height.equalTo(180)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(98)
            make.height.equalTo(35)
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(88)
            make.height.equalTo(27)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}
