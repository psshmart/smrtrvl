//
//  AppCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import AuthenticationServices

class AppCoordinator: Coordinator {

    private let window: UIWindow
    var starterCoordinator: FirstCoordinator?
    var navigationController: UINavigationController
    var tabBarController: MainTabBarController?

    init(window: UIWindow = UIWindow(),
        navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupStarterCoordinator()
    }

    func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    func setupStarterCoordinator() {
        starterCoordinator = FirstCoordinator(navigationController: navigationController)
        starterCoordinator?.parentCoordinator = self
        setupWindow()
    }
    
    func setupTabBarAsRoot() {
        self.window.rootViewController = MainTabBarController()
        self.window.makeKeyAndVisible()
    }
    
    func checkAuthorization() {
        let user = Auth.auth().currentUser
    
        if user != nil {
            setupTabBarAsRoot()
        } else {
            setupStarterCoordinator()
            starterCoordinator?.start()
        }
    }

    func start() {
//        let user = Auth.auth()
//        do {
//            try user.signOut()
//        } catch let error as NSError {
//            print(error)
//        }
        checkAuthorization()
    }




}
