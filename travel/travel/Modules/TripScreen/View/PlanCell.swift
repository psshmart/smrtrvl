//
//  TripCell.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class PlanCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var planName: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 30, style: .semibold)
        label.textColor = CustomColors.whiteTitle
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
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 30, style: .regular)
        label.textColor = CustomColors.nonSelectedWhite
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView() {
        addSubview(backView)
        addSubview(planName)
        addSubview(dateLabel)
        
        backView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(70)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        planName.snp.makeConstraints { make in
            make.centerY.equalTo(backView)
            make.width.lessThanOrEqualTo(160)
            make.leading.equalToSuperview().offset(35)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView)
            make.trailing.equalToSuperview().offset(50)
            make.width.lessThanOrEqualTo(100)
        }
        
    }
}
