//
//  CustomButton.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit

class CustomLoginButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()

        self.clipsToBounds = true
        layer.cornerRadius = 15
        self.backgroundColor = UIColor(red: 67/255, green: 25/255, blue: 119/255, alpha: 0.51)
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attributedString = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: CustomFonts.openSans(size: 23, style: .regular)])
        super.setAttributedTitle(attributedString, for: state)
    }

}
