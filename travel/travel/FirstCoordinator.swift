//
//  FirstCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

class FirstCoordinator: Coordinator {


    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func start() {
        showSignInScene()
    }

    private func showSignInScene() {
        let scene = FirstCoordinatorFactory.makeSignInScene()
        scene.signInCoordinator = SignInCoordinator(navigationController: navigationController)
        navigationController.pushViewController(scene, animated: true)
    }
}
