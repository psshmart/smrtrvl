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
    
    func getAddPlanController() {
        showAddPlanScene()
    }
    
    private func showAddPlanScene() {
        let scene = CreateTripSceneFactory.createAddPlanScene()
        scene.router = AddPlanRouter(navigationController: navigationController)
        navigationController.pushViewController(scene, animated: true)
        
    }
    
    
}
