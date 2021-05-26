//
//  TripController.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class PlanController: UITableViewController {
    
    private let backView = BackgroundView()
    private var transportAmount: Int?
    private var residenceAmount: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(TripNameCell.self, forCellReuseIdentifier: "name")
        tableView.register(TransportCell.self, forCellReuseIdentifier: "transport")
        tableView.register(ResidenceInfoCell.self, forCellReuseIdentifier: "residence")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    
}
