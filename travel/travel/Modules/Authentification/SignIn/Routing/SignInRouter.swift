//
//  SignInCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

class SignInRouter: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?

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
        scene.signUpCoordinator = SignUpRouter.init(navigationController: navigationController)
        scene.presenter = SignUpPresenter()
        scene.presenter?.viewController = scene
        scene.presenter?.didSignUp = { [weak scene] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                scene?.signUpCoordinator?.showSignInScene()
            }
        }
       navigationController.pushViewController(scene, animated: true)
    }
    
    func showMyTripsScene() {
        parentCoordinator?.setupTabBarAsRoot()
    }
}
