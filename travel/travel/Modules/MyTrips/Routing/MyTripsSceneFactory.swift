//
//  MyTripsSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 15.05.2021.
//

import UIKit

struct MyTripsSceneFactory {
    static func makeCreateTripScene() -> CreateTripMainController {
        let viewController = CreateTripMainController()
        return viewController
    }
}
