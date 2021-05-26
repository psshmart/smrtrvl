//
//  CreateTripRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class CreateTripRouter: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func getMyTripsController() {
        showMyTripsScene()
    }
    
    func getAddPlanController(trip: Trip, delegate: PlanSaved) {
        showAddPlanScene(trip: trip, delegate: delegate)
    }
    
    private func showAddPlanScene(trip: Trip, delegate: PlanSaved) {
        let scene = CreateTripSceneFactory.createAddPlanScene()
        scene.router = AddPlanRouter(navigationController: navigationController)
        scene.presenter = AddPlanPresenter(trip: trip, view: scene)
        scene.delegate = delegate
        navigationController.pushViewController(scene, animated: true)
    }
    
    private func showMyTripsScene() {
        CreateTripSceneFactory.showMyTrispScene(navigationController: navigationController)
    }
    
    
}
