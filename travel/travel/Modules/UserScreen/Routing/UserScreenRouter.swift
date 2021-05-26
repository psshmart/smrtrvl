//
//  UserScreenRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit


class UserScreenRouter: Coordinator {
    
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
    
    func getSettingsController() {
        showSettingsScene()
    }
    
    private func showSettingsScene() {
        let scene = UserScreenSceneFactory.makeSettingsScene()
        scene.router = SettingsRouter(navigationController: navigationController)
        scene.presentor = SettingsPresenter()
        navigationController.pushViewController(scene, animated: true)
    }
}
