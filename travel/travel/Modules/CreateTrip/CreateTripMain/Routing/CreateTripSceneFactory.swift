//
//  CreateTripSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

struct CreateTripSceneFactory {
    static func createAddPlanScene() -> AddPlanController {
        let viewController = AddPlanController()
        return viewController
    }
}
