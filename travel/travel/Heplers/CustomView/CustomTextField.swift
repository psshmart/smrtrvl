//
//  CustomTextField.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit

class CustomTextField: UITextField {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 252/255.0, alpha: 0.39)
        self.textColor = .white
        self.font = CustomFonts.openSans(size: 14, style: .regular)
        self.autocorrectionType = .no
    }

    func setPlaceholder(text: String) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }

}
