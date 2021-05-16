//
//  MainTabBarController.swift
//  travel
//
//  Created by Svetlana Safonova on 27.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    var myTripsController: MyTripsViewController = MyTripsViewController()
    var usersTripsController: UsersTripsViewController = UsersTripsViewController()
    var userScreenController: UserScreenViewController = UserScreenViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewControllers()
        
    }

    private func createViewControllers() {
        setMyTripsCoordinator()
        setUsersTripsCoordinator()
        setUserScreenCoordinator()
        guard let userScreenCoordinator = userScreenController.coordinator else { return }
        guard let usersTripsCoordinator = usersTripsController.coordinator else { return }
        guard let myTripsCoordinator = myTripsController.coordinator else { return }
        self.viewControllers = [myTripsCoordinator.navigationController, usersTripsCoordinator.navigationController, userScreenCoordinator.navigationController]
    }
    
    private func setMyTripsCoordinator() {
        myTripsController.coordinator = MyTripsRouter.init(navigationController: UINavigationController(rootViewController: myTripsController))
        myTripsController.presenter = MyTripsPresenter()
        myTripsController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        myTripsController.presenter?.doesTripExist()
    }
    
    private func setUsersTripsCoordinator() {
        usersTripsController.coordinator = UsersTripsCoordinator.init(navigationController: UINavigationController(rootViewController: usersTripsController))
        usersTripsController.presenter = UsersTripsPresenter()
        usersTripsController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper"))
    }
    
    private func setUserScreenCoordinator() {
        userScreenController.coordinator = UserScreenRouter.init(navigationController: UINavigationController(rootViewController: userScreenController))
        userScreenController.presenter = UserScreenPresenter()
        userScreenController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
    }
}
