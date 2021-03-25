//
//  BackgroundView.swift
//  travel
//
//  Created by Svetlana Safonova on 26.03.2021.
//

import UIKit

class BackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackground() {
        let image = UIImage(named: "background")
        let backgroundView = UIImageView(image: image)
        backgroundView.contentMode = .scaleAspectFill

        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(10)

        }
    }

}
