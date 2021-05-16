//
//  FirstCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

class FirstCoordinator: Coordinator {
    
    weak var parentCoordinator: AppCoordinator?


    var navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func start() {
        showSignInScene()
    }

    private func showSignInScene() {
        let scene = FirstCoordinatorFactory.makeSignInScene()
        scene.signInRouter = SignInRouter(navigationController: navigationController)
        scene.signInRouter?.parentCoordinator = parentCoordinator
        scene.presenter = SignInPresenter()
        scene.presenter?.viewController = scene
        scene.presenter?.didSignIn = { [weak scene] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                scene?.signInRouter?.showMyTripsScene()
            }
        }
        navigationController.pushViewController(scene, animated: true)
    }
}
