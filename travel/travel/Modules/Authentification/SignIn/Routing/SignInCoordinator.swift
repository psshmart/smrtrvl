//
//  SignInCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

class SignInCoordinator: Coordinator {

    func start() {
        return
    }


    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func getSignUpViewController() {
        showSignUpScene()
    }

    private func showSignUpScene() {
        let scene = SignInSceneFactory.makeSignUpScene()
        scene.signUpCoordinator = SignUpCoordinator.init(navigationController: navigationController)
        scene.presenter = SignUpPresenter()
        navigationController.pushViewController(scene, animated: true)
    }
}
