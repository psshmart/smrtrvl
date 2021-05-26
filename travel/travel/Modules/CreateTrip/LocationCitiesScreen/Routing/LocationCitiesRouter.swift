//
//  LocationCitiesRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 19.05.2021.
//

import UIKit

class LocationCitiesRouter: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func showAddPlanController() {
        getAddPlanScene()
    }
    
    private func getAddPlanScene() {
        LocationCitiesSceneFactory.getAddPlanController(navigationController: navigationController)
    }
}
