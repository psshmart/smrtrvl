//
//  CustomAddButton.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class CustomAddButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        layer.cornerRadius = 20
        self.backgroundColor = CustomColors.buttonLightPurple
        self.contentHorizontalAlignment = .left
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
       
        let attributedString = NSAttributedString(string: title ?? "", attributes: [NSAttributedString.Key.foregroundColor: CustomColors.whiteTitle, NSAttributedString.Key.font: CustomFonts.openSans(size: 24, style: .regular)])
        super.setAttributedTitle(attributedString, for: state)
    }
    
}
