//
//  AddPlanSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

struct AddPlanSceneFactory {
    static func createLocationScene() -> LocationCountryController {
        let viewController = LocationCountryController()
        return viewController
    }
    
    static func makeCreateTripsScene(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
