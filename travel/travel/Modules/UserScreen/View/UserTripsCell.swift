//
//  UserTripsCell.swift
//  travel
//
//  Created by Svetlana Safonova on 11.05.2021.
//

import UIKit

class UserTripsCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backView: UIView = {
        let view = UIView(frame: CGRect(x: 27, y: 0, width: 364, height: 120))
        view.layer.backgroundColor = CustomColors.nonSelectedViewPurple.cgColor
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        return view
    }()

    let tripNameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 26, style: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
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
        contentView.addSubview(backView)
        backView.addSubview(tripNameLabel)
        backView.addSubview(dateLabel)
        
        backView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(364)
            make.height.equalTo(120)
            make.top.equalToSuperview().offset(5)
        }
        
        tripNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(35)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(60)
            make.width.greaterThanOrEqualTo(120)
        }
    }
}
