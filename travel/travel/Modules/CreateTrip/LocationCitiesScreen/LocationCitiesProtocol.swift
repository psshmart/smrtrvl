//
//  LocationCitiesProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 19.05.2021.
//

import UIKit

protocol LocationCitiesViewInput: AnyObject {
    var cities: [String] { get set }
    var country: String { get set }
    var citiesTableView: UITableView { get set }
}

protocol LocationCitiesViewOutput {
    func viewDidLoad()
}
