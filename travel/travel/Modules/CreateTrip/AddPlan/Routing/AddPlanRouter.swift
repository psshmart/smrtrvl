//
//  AddPlanRouter.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class AddPlanRouter: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func getCreateTripViewController() {
        showCreateTripScene()
    }
    
    func getLocationViewController(source: String, index: Int, presenter: LocationDelegate) {
        switch source {
        case "plan":
            showLocationScene(source: source, presenter: presenter)
        case "start":
            showLocationSceneForStart(source: source, index: index, presenter: presenter)
        case "end":
            showLocationSceneForEnd(source: source, index: index, presenter: presenter)
        default:
            print("nothing")
        }
        
    }
    
    private func showCreateTripScene() {
        AddPlanSceneFactory.makeCreateTripsScene(navigationController: navigationController)
    }
    
    private func showLocationScene(source: String, presenter: LocationDelegate) {
        let scene = AddPlanSceneFactory.createLocationScene()
        scene.router = LocationRouter(navigationController: UINavigationController())
        let thisPresenter = LocationCountryPresenter(view: scene, locationService: LocationService())
        scene.gotFrom = source
        scene.presenter = thisPresenter
        scene.delegate = presenter
        scene.router!.navigationController.pushViewController(scene, animated: true)
        navigationController.present(scene.router!.navigationController, animated: true)
        
    }
    
    private func showLocationSceneForStart(source: String, index: Int, presenter: LocationDelegate) {
        let scene = AddPlanSceneFactory.createLocationScene()
        scene.router = LocationRouter(navigationController: UINavigationController())
        scene.gotFrom = source
        scene.index = index
        scene.delegate = presenter
        let presenter = LocationCountryPresenter(view: scene, locationService: LocationService())
        scene.presenter = presenter
        scene.router!.navigationController.pushViewController(scene, animated: true)
        navigationController.present(scene.router!.navigationController, animated: true)
    }
    
    private func showLocationSceneForEnd(source: String, index: Int, presenter: LocationDelegate) {
        let scene = AddPlanSceneFactory.createLocationScene()
        scene.router = LocationRouter(navigationController: UINavigationController())
        scene.gotFrom = source
        scene.index = index
        scene.delegate = presenter
        let presenter = LocationCountryPresenter(view: scene, locationService: LocationService())
        scene.presenter = presenter
        scene.router!.navigationController.pushViewController(scene, animated: true)
        navigationController.present(scene.router!.navigationController, animated: true)
    }
}
