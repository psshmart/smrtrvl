//
//  TripNameCellTableViewCell.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class PlanNameCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tripTitle: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 36, style: .semibold)
        label.textColor = CustomColors.yellowLable
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var backView: CustomBackView = {
        let view = CustomBackView()
        view.layer.backgroundColor = CustomColors.selectedViewPurple.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var locationTitle: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 28, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func setupView() {
        addSubview(backView)
        addSubview(tripTitle)
        backView.addSubview(locationTitle)
        
        tripTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(46)
            make.width.lessThanOrEqualTo(200)
        }
        
        backView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(tripTitle.snp.bottom).offset(25)
        }
        
        locationTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }

    }

}
