//
//  CustomSignUpButton.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit

class CustomSignUpButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()

        
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attributedString = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 254/255, green: 241/255, blue: 0/255, alpha: 1), NSAttributedString.Key.font: CustomFonts.openSans(size: 20, style: .bold)])
        super.setAttributedTitle(attributedString, for: state)
    }

}
