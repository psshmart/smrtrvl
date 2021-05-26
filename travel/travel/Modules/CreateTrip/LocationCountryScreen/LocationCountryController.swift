//
//  LocationController.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class LocationCountryController: UITableViewController, LocationCountryViewInput {
    
    var data: [Country] = []
    var router: LocationRouter?
    var presenter: LocationCountryViewOutput?
    lazy var countriesTableView: UITableView = self.tableView
    var gotFrom: String?
    var index: Int = 0
    var delegate: LocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let source = gotFrom else { return }
        router?.getCitiesController(data: data[indexPath.row], source: source, index: index, delegate: delegate!)
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
