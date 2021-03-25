//
//  CustomFonts.swift
//  travel
//
//  Created by Svetlana Safonova on 10.03.2021.
//

import UIKit

enum Style: String {
    case light = "Light"
    case bold = "Bold"
    case semibold = "SemiBold"
    case regular = "Regular"
}

class CustomFonts: UIFont {
    static func openSans(size: CGFloat, style: Style) -> UIFont {
        return UIFont(name: "OpenSans-\(style.rawValue)", size: size) ?? UIFont()
    }

}


