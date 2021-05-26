//
//  CustomDatePicker.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class CustomDatePicker: UIView {

    private var width: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init(width: Int) {
        super.init(frame: CGRect())
        self.width = width
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
        addSubview(dateLabel)
        addSubview(datePicker)
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
            make.trailing.lessThanOrEqualToSuperview().offset(-50)
        }
        
        datePicker.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10).priority(1000)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(width)
        }
        
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
}
