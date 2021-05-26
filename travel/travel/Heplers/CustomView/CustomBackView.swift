//
//  CustomBackView.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class CustomBackView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backView: UIView = {
        let view = UIView(frame: CGRect(x: 27, y: 0, width: 364, height: 120))
        view.backgroundColor = CustomColors.nonSelectedViewPurple
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        
        return view
    }()
    
    private func setupView() {
        addSubview(backView)
        backgroundColor = .clear
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(364)
            make.height.equalTo(47)
        }
    }
}
