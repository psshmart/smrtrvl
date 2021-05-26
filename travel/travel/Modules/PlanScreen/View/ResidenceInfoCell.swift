//
//  ResidenceInfoCell.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class ResidenceInfoCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backView: CustomBackView = {
        let view = CustomBackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 18, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var startLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 15, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var endLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 15, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var budgetLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 17, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var stackViewDate: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
    
    
    
    private func setupView() {
        backgroundColor = .clear
        stackViewDate.addArrangedSubview(startLabel)
        stackViewDate.addArrangedSubview(endLabel)
    
        
        addSubview(backView)
        addSubview(stackViewDate)
        addSubview(nameLabel)
        addSubview(budgetLabel)
        
        
        backView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(230)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(20)
            make.width.lessThanOrEqualTo(40)
            make.centerX.equalToSuperview()
        }
        
        stackViewDate.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        budgetLabel.snp.makeConstraints { make in
            make.top.equalTo(stackViewDate.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualTo(150)
        }
        
        
    }

}
