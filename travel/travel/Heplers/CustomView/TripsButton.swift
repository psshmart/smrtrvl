//
//  TripsButton.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit

class TripsButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 0.4
        layer.borderColor = UIColor(red: 101/255, green: 59/255, blue: 149/255, alpha: 0.53).cgColor
        layer.backgroundColor = UIColor(red: 101/255, green: 59/255, blue: 149/255, alpha: 0.29).cgColor
        layer.masksToBounds = false
        
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attributedString = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 242/255, green: 240/255, blue: 255/255, alpha: 1), NSAttributedString.Key.font: CustomFonts.openSans(size: 24, style: .regular)])
        super.setAttributedTitle(attributedString, for: state)
    }

}
