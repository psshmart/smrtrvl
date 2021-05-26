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
        let attributedString = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: CustomColors.yellowLable, NSAttributedString.Key.font: CustomFonts.openSans(size: 20, style: .bold)])
        super.setAttributedTitle(attributedString, for: state)
    }

}
