//
//  CustomTextField.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 252/255.0, alpha: 0.39)
        self.textColor = .white
        self.font = CustomFonts.openSans(size: 14, style: .regular)
        self.autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    
    func setPlaceholder(text: String, screen: String) {
        switch screen {
        case "createTrip":
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: CustomColors.nonSelectedWhite])
        default:
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        }
    }

}
