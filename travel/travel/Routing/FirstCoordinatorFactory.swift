//
//  FirstCoordinatorFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

struct FirstCoordinatorFactory {
    static func makeSignInScene() -> SignInViewController {
        let viewController = SignInViewController()
        return viewController
    }
}
