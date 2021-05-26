//
//  SettingsRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 27.05.2021.
//

import UIKit

class SettingsRouter: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        
    }
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
}
