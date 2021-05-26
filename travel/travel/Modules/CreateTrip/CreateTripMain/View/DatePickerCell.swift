//
//  DatePickerCell.swift
//  travel
//
//  Created by Svetlana Safonova on 15.05.2021.
//

import UIKit

class DatePickerCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 24, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Starts"
        return label
    }()
    
    var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.tintColor = CustomColors.yellowLable
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.isUserInteractionEnabled = false
        addSubview(dateLabel)
        addSubview(datePicker)
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.lessThanOrEqualToSuperview().offset(-50)
        }
        
        datePicker.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(135)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
    }

}
