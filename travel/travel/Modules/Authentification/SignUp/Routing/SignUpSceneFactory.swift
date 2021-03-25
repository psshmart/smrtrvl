//
//  SignUpSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

struct SignUpSceneFactory {
    static func makeSignInScene(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
