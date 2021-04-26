//
//  Coordinator.swift
//  travel
//
//  Created by Svetlana Safonova on 25.03.2021.
//

import UIKit

protocol Coordinator {

    var navigationController: UINavigationController { get set }

    func start()
}
