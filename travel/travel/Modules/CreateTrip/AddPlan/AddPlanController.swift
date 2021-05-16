//
//  AddPlanController.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class AddPlanController: UITableViewController {

    private let backView = BackgroundView()
    var router: AddPlanRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(LocationCell.self, forCellReuseIdentifier: "location")
        tableView.separatorStyle = .none
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath) as! LocationCell
            return cell
        default:
            print("loh")
        }
        

        return cell
    }
    

}
