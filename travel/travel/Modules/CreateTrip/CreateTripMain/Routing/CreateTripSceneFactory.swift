//
//  CreateTripSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

struct CreateTripSceneFactory {
    static func createAddPlanScene() -> AddPlanController {
        let viewController = AddPlanController(style: .grouped)
        return viewController
    }
    static func showMyTrispScene(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
