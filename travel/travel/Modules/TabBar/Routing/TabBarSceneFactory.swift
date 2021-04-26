//
//  TabBarSceneFactory.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

import UIKit

struct TabBarSceneFactory {
    static func makeTripsScene() -> MyTripsViewController{
        let viewController = MyTripsViewController()
        return viewController
    }
    
    static func makePublicTripsScene() -> UsersTripsViewController {
        let viewController = UsersTripsViewController()
        return viewController
    }
}
