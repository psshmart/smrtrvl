//
//  TripSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

struct TripSceneFactory {
    static func showMyTripsScene(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
    
    static func showPlanScene() -> PlanController {
        let viewController = PlanController(style: .grouped)
        return viewController
    }
}
