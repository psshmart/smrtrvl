//
//  UsersTripsCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

import UIKit

class UsersTripsCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func getTripController(trip: Trip) {
        showTripScene(trip: trip)
    }
    
    private func showTripScene(trip: Trip) {
        let scene = MyTripsSceneFactory.makeTripScrene()
        scene.presenter = TripPresenter(trip: trip, view: scene)
        scene.router = TripRouter(navigationController: navigationController)
        navigationController.pushViewController(scene, animated: true)
    }
}

