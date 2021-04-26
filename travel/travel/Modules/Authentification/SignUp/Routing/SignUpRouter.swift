//
//  SignUpCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

class SignUpRouter: Coordinator {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSignInScene()
    }

    func showSignInScene() {
        SignUpSceneFactory.makeSignInScene(navigationController: navigationController)
    }


}
