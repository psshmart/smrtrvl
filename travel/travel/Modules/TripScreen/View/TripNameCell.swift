//
//  TripNameCell.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class TripNameCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var tripTitle: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 36, style: .semibold)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var backView: CustomBackView = {
        let view = CustomBackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(backView)
        addSubview(tripTitle)
        
        backView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(170)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        tripTitle.snp.makeConstraints { make in
            make.centerX.equalTo(backView)
            make.centerY.equalTo(backView)
            make.height.equalTo(40)
        }
    }
    
}
