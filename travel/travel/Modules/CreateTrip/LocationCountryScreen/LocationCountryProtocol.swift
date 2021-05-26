//
//  LocationProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 17.05.2021.
//

import UIKit

protocol LocationCountryViewInput: AnyObject {
    var data: [Country] { get set }
    var countriesTableView: UITableView { get set }
}

protocol LocationCountryViewOutput {
    func viewDidLoad()
}
