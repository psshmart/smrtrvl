//
//  TransportInfoCell.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class TransportInfoCell: UITableViewCell {
    
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

    var startDatePickerView: CustomDatePicker = {
        let view = CustomDatePicker(width: 250)
        view.dateLabel.text = "Starts"
        return view
    }()
    
    var endsDatePickerView: CustomDatePicker = {
        let view = CustomDatePicker(width: 250)
        view.dateLabel.text = "Ends"
        return view
    }()
    
    var startLocationView: LocationView = {
        let view = LocationView()
        view.locationLabel.text = "From"
        return view
    }()
    
    var endLocationView: LocationView = {
        let view = LocationView()
        view.locationLabel.text = "Where"
        return view
    }()
    
    var budgetView: LableAndTextFieldView = {
        let view = LableAndTextFieldView()
        view.titleLabel.text = "Budget"
        view.valueTextField.setMaxSymblos(count: 15)
        return view
    }()
    
    var pickerView: LocationPickerView = {
        let view = LocationPickerView()
        return view
    }()
    
    private func setupView() {
        selectionStyle = .none
        
        contentView.isUserInteractionEnabled = false
        backgroundColor = .clear
        addSubview(backView)
        addSubview(startDatePickerView)
        addSubview(endsDatePickerView)
        addSubview(startLocationView)
        addSubview(endLocationView)
        addSubview(budgetView)
        addSubview(pickerView)
        
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(365)
            make.height.equalTo(400)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        startDatePickerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(45)
        }
        
        endsDatePickerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(startDatePickerView.snp.bottom).offset(5)
        }
        
        startLocationView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(endsDatePickerView.snp.bottom).offset(5)
        }
        
        endLocationView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(startLocationView.snp.bottom).offset(5)
        }
        
        budgetView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(endLocationView.snp.bottom).offset(10)
        }
        
        pickerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
            make.top.equalTo(budgetView.snp.bottom)
        }

    }
    
}


