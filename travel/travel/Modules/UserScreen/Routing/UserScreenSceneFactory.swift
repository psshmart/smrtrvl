//
//  UserScreenSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

struct UserScreenSceneFactory {
    static func makeTripScrene() -> TripController {
        let viewController = TripController()
        return viewController
    }
    
    static func makeSettingsScene() -> SettingsController {
        let viewController = SettingsController()
        return viewController
    }
}
