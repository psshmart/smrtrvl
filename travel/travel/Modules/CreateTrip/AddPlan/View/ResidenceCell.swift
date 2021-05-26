//
//  ResidenceCell.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import UIKit

class ResidenceCell: UITableViewCell, UITextFieldDelegate {

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
    
    var nameView: LableAndTextFieldView = {
        let view = LableAndTextFieldView()
        view.titleLabel.text = "Name"
        view.valueTextField.setMaxSymblos(count: 15)
        return view
    }()
    
    var startDayResidenceView: CustomDatePicker = {
        let view = CustomDatePicker(width: 250)
        view.dateLabel.text = "Starts"
        view.datePicker.datePickerMode = .dateAndTime
        return view
    }()
    
    var endDayResidenceView: CustomDatePicker = {
        let view = CustomDatePicker(width: 250)
        view.dateLabel.text = "Ends"
        view.datePicker.datePickerMode = .dateAndTime
        return view
    }()
    
    var budgetView: LableAndTextFieldView = {
        let view = LableAndTextFieldView()
        view.titleLabel.text = "Budget"
        view.valueTextField.setMaxSymblos(count: 15)
        return view
    }()
    
    private func setupView() {
        selectionStyle = .none
    
        contentView.isUserInteractionEnabled = false
        backgroundColor = .clear
        addSubview(backView)
        addSubview(nameView)
        addSubview(startDayResidenceView)
        addSubview(endDayResidenceView)
        addSubview(budgetView)
        
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(365)
            make.height.equalTo(270)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        nameView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(45)
        }
        
        startDayResidenceView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(nameView.snp.bottom).offset(5)
        }
        
        endDayResidenceView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(startDayResidenceView.snp.bottom).offset(5)
        }
        
        budgetView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(endDayResidenceView.snp.bottom).offset(10)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 20
    }

}
