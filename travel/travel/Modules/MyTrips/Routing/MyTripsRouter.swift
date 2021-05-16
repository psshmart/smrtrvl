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
    
    private func showCreateTripScene() {
        let scene = MyTripsSceneFactory.makeCreateTripScene()
        scene.coordinator = CreateTripRouter.init(navigationController: navigationController)
        navigationController.pushViewController(scene, animated: true)
    }
    
}
