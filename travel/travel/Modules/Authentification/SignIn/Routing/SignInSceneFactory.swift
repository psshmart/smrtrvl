//
//  SignInSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

struct SignInSceneFactory {
    static func makeSignUpScene() -> SignUpViewController {
        let viewController = SignUpViewController()
        return viewController
    }
    static func makeMyTripsScene() -> MainTabBarController {
        let viewController = MainTabBarController()
        return viewController
    }
}
