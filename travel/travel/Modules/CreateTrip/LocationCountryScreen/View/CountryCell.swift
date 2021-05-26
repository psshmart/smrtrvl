//
//  CountryCell.swift
//  travel
//
//  Created by Svetlana Safonova on 19.05.2021.
//

import UIKit

class CountryCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backView: UIView = {
        let view = UIView(frame: CGRect(x: 27, y: 0, width: 364, height: 320))
        view.layer.backgroundColor = CustomColors.nonSelectedViewPurple.cgColor
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 20, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    func setupView() {
        selectionStyle = .default
        backgroundColor = .clear
        
        addSubview(backView)
        addSubview(titleLabel)
        
        backView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(46)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(15)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(350)
            make.leading.equalTo(backView.snp.leading).offset(15)
            make.centerY.equalTo(backView)
        }
    }
    
}
