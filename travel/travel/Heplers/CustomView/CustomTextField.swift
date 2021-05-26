//
//  CustomTextField.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    
    private var symbolsCount: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 252/255.0, alpha: 0.39)
        self.textColor = .white
        self.font = CustomFonts.openSans(size: 18, style: .regular)
        self.autocorrectionType = .no
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setMaxSymblos(count: Int) {
        self.symbolsCount = count
    }

    
    func setPlaceholder(text: String, screen: String) {
        switch screen {
        case "createTrip":
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: CustomColors.nonSelectedWhite])
        default:
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        
        
        return updatedText.count <= symbolsCount ?? 30
    }

}
