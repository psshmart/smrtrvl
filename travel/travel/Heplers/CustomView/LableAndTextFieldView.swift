//
//  BudgetView.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class LableAndTextFieldView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let budgetLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 24, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Planned budget"
        return label
    }()
    
    let budgetTextField: UITextField = {
        let textField = CustomTextField()
        textField.textAlignment = .right
        textField.backgroundColor = .clear
        textField.setPlaceholder(text: "Enter here", screen: "createTrip")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private func setupView() {

        backgroundColor = .clear
        addSubview(budgetLabel)
        addSubview(budgetTextField)
        
        budgetLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.lessThanOrEqualToSuperview().offset(-50)
        }
        
        budgetTextField.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.leading.greaterThanOrEqualTo(budgetLabel.snp.trailing).offset(47)
            make.trailing.equalToSuperview().offset(-35)
            make.height.equalTo(37)
        }
        
        budgetLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
