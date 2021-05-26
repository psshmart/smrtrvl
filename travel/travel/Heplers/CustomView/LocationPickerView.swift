//
//  LocationPickerView.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import UIKit
import SnapKit

class LocationPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var didChangeType: ((TransportType) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pickerView.delegate = self
        pickerView.dataSource = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var pickerData: [TransportType] = [.Airplane, .Bus, .Car, .Train]
    
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = CustomFonts.openSans(size: 24, style: .regular)
        label.textColor = CustomColors.whiteTitle
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Type"
        return label
    }()
    
    var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.setValue(CustomColors.whiteTitle, forKey: "textColor")
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didChangeType?(pickerData[row])
    }
    
    
    private func setupView() {
        addSubview(pickerView)
        addSubview(typeLabel)
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(30)
            make.trailing.lessThanOrEqualToSuperview().offset(-50)
        }
        
        pickerView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.centerY.equalToSuperview()
            make.leading.greaterThanOrEqualTo(typeLabel.snp.trailing).offset(47)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(90)
        }
        
    }

}
