//
//  TabBarCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var viewController: MainTabBarController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        makeTripsCoordinator()
        makePublicTripsCoordinator()
    }
    
    private func makeTripsCoordinator() {
        let scene = TabBarSceneFactory.makeTripsScene()
        scene.coordinator = MyTripsCoordinator.init(navigationController: UINavigationController(rootViewController: scene))
        scene.presenter = MyTripsPresenter()
        
        viewController?.viewControllers = [scene.coordinator!.navigationController]
        scene.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
    }
    
    private func makePublicTripsCoordinator() {
        let scene = TabBarSceneFactory.makePublicTripsScene()
        scene.coordinator = UsersTripsCoordinator.init(navigationController: UINavigationController(rootViewController: scene))
        scene.presenter = UsersTripsPresenter()
        viewController?.viewControllers?.append(scene.coordinator!.navigationController)
        scene.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper"))
    }
    
    
}
