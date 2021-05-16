//
//  TripsSegmentedControl.swift
//  travel
//
//  Created by Svetlana Safonova on 15.05.2021.
//

import UIKit

protocol TripsSegmentedControlDelegate: class {
    func changeToIndex(index:Int)
}

class TripsSegmentedControl: UIView {

    weak var delegate: TripsSegmentedControlDelegate?
    private var buttonTitles: [String]!
    private var buttons: [TripsButton] = []
    private var selectorView: UIView!
    
    var textColor: UIColor = CustomColors.nonSelectedWhite
    var selectedView: UIColor = CustomColors.selectedViewPurple
    var selectedTextColor: UIColor = CustomColors.whiteTitle
    
    convenience init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitles
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    

    
    private func createButtons() {
        buttons = [TripsButton]()
        buttons.removeAll()
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = TripsButton.init(frame: frame)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(TripsSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].changeSelectedColors()
        buttons[0].setTitleColor(textColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        for (btnIndex, btn) in buttons.enumerated(){
            if btn == sender {
                delegate?.changeToIndex(index: btnIndex)
                btn.changeSelectedColors()
                
            }
            else {
                btn.changeNonSelectedColors()
            }
        }
    }
    
    private func updateView() {
        createButtons()
        setupStackView()
    }

}
