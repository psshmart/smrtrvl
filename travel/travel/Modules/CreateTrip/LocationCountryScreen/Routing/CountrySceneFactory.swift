//
//  CountrySceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 19.05.2021.
//

import UIKit

struct CountrySceneFactory {
    static func createCitiesScreen() -> LocationCitiesController {
        let viewController = LocationCitiesController()
        return viewController
    }
}
