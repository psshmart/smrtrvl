//
//  LocationController.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class LocationCountryController: UITableViewController, LocationViewInput {
    
    var data: [Country] = []
    var router: LocationRouter?
    var presenter: LocationViewOutput?
    lazy var countriesTableView: UITableView = self.tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(CountryCell.self, forCellReuseIdentifier: "country")
        tableView.backgroundColor = CustomColors.backgroundTableView
        tableView.separatorStyle = .none
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CountryCell
        cell.titleLabel.text = data[indexPath.row].country

        return cell
    }
    
    
}
