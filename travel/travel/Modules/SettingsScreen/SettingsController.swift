//
//  SettingsController.swift
//  travel
//
//  Created by Svetlana Safonova on 27.05.2021.
//

import UIKit

class SettingsController: UIViewController {

    var router: SettingsRouter?
    var presentor: SettingsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var backView = BackgroundView(frame: view.frame)
        view.addSubview(backView)
        var settingsView = SettingsView()
        view.addSubview(settingsView)
        settingsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        settingsView.logoutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc private func logOut(sender: UIButton) {
        presentor?.logOut()
    }

}
