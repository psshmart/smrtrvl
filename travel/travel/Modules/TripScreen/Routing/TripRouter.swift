//
//  TripRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class TripRouter: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func getPlanController(plan: Plan) {
        showPlanController(plan: plan)
    }
    
    func getMyTipsController() {
        showMyTripsScene()
    }
    
    private func showMyTripsScene() {
        TripSceneFactory.showMyTripsScene(navigationController: navigationController)
    }
    
    private func showPlanController(plan: Plan) {
        let scene = TripSceneFactory.showPlanScene()
        scene.presenter = PlanPresenter(plan: plan, view: scene)
        navigationController.pushViewController(scene, animated: true)
        
    }
}
