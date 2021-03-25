//
//  AppCoordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit


class AppCoordinator: Coordinator {

    private let window: UIWindow
    var starterCoordinator: Coordinator?
    var navigationController: UINavigationController

    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
        setupStarterCoordinator()
    }

    func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    func setupStarterCoordinator() {
        starterCoordinator = FirstCoordinator(navigationController: navigationController)
    }

    func start() {
        starterCoordinator?.start()
    }




}
