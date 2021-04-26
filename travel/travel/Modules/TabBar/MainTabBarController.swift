//
//  MainTabBarController.swift
//  travel
//
//  Created by Svetlana Safonova on 27.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    var coordinator: TabBarCoordinator?
    var myTripsController: MyTripsViewController = MyTripsViewController()
    var usersTripsController: UsersTripsViewController = UsersTripsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewControllers()
        
    }

    private func createViewControllers() {
        setMyTripsCoordinator()
        setUsersTripsCoordinator()
        guard let usersTripsCoordinator = usersTripsController.coordinator else { return }
        guard let myTripsCoordinator = myTripsController.coordinator else { return }
        self.viewControllers = [myTripsCoordinator.navigationController, usersTripsCoordinator.navigationController]
    }
    
    private func setMyTripsCoordinator() {
        myTripsController.coordinator = MyTripsCoordinator.init(navigationController: UINavigationController(rootViewController: myTripsController))
        myTripsController.presenter = MyTripsPresenter()
        myTripsController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        myTripsController.presenter?.doesTripExist()
    }
    
    private func setUsersTripsCoordinator() {
        usersTripsController.coordinator = UsersTripsCoordinator.init(navigationController: UINavigationController(rootViewController: usersTripsController))
        usersTripsController.presenter = UsersTripsPresenter()
        usersTripsController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper"))
    }
}
