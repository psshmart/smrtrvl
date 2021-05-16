//
//  TripsButton.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit

class TripsButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton() {
        self.clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 0.4
        layer.borderColor = UIColor(red: 101/255, green: 59/255, blue: 149/255, alpha: 0.53).cgColor
        layer.backgroundColor = UIColor(red: 101/255, green: 59/255, blue: 149/255, alpha: 0.29).cgColor
        layer.masksToBounds = false
    }
    
    func changeSelectedColors() {
        layer.backgroundColor = CustomColors.selectedViewPurple.cgColor
        setTitleColor(CustomColors.whiteTitle, for: .normal)
    }
    
    func changeNonSelectedColors() {
        layer.backgroundColor = CustomColors.nonSelectedViewPurple.cgColor
        setTitleColor(CustomColors.nonSelectedWhite, for: .normal)
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attributedString = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: CustomColors.nonSelectedWhite, NSAttributedString.Key.font: CustomFonts.openSans(size: 24, style: .regular)])
        super.setAttributedTitle(attributedString, for: state)
    }

}
