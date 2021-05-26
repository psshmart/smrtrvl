//
//  LocationRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import UIKit

class LocationRouter: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func getCitiesController(data: Country, source: String, index: Int, delegate: LocationDelegate) {
        showCitiesScreen(data: data, source: source, index: index, delegate: delegate)
    }
    
    private func showCitiesScreen(data: Country, source: String, index: Int, delegate: LocationDelegate) {
        let scene = CountrySceneFactory.createCitiesScreen()
        scene.router = LocationCitiesRouter(navigationController: navigationController)
        scene.presenter = LocationCitiesPresenter(view: scene, data: data)
        scene.gotFrom = source
        scene.index = index
        scene.delegate = delegate
        scene.modalTransitionStyle = .flipHorizontal
        scene.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(scene, animated: true)
    }
}
