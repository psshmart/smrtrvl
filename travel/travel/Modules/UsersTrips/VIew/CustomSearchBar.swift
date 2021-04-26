//
//  CustomSearchBar.swift
//  travel
//
//  Created by Svetlana Safonova on 31.03.2021.
//

import UIKit

class CustomSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0] as! UIView
     
        for i in 0...searchBarView.subviews.count {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        return index
    }
    
    var searchField: UITextField = {
        let field = UITextField(frame: CGRect(x: 35, y: 2, width: 340, height: 50))
        field.font = CustomFonts.openSans(size: 18, style: .regular)
        field.textColor = UIColor(red: 70/255, green: 72/255, blue: 84/255, alpha: 1)
        
        return field
    }()
    
}
