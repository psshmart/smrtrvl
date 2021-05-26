//
//  MyTripsCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 27.03.2021.
//

import UIKit

class MyTripsRouter: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        
    }
    func start() {
        
    }
    
    func getCreateTripViewController() {
        showCreateTripScene()
    }
    
    func getTripController(trip: Trip) {
        showTripScene(trip: trip)
    }
    
    private func showCreateTripScene() {
        let scene = MyTripsSceneFactory.makeCreateTripScene()
        scene.coordinator = CreateTripRouter.init(navigationController: navigationController)
        scene.presenter = CreateTripMainPresenter(view: scene)
        navigationController.pushViewController(scene, animated: true)
    }
    
    private func showTripScene(trip: Trip) {
        let scene = MyTripsSceneFactory.makeTripScrene()
        scene.presenter = TripPresenter(trip: trip, view: scene)
        scene.router = TripRouter(navigationController: navigationController)
        navigationController.pushViewController(scene, animated: true)
    }
    
}
