//
//  UsersTripsViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

import UIKit

class UsersTripsViewController: UITableViewController, UISearchBarDelegate {

    private let backView = BackgroundView()
    var searchBar = UISearchBar()
    var coordinator: UsersTripsCoordinator?
    var presenter: UsersTripsPresenter?
    var doesExist: Bool?
    private var usersTripsCellView = UsersTripsCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(UsersTripsCell.self, forCellReuseIdentifier: "UsersTripsCell")
        tableView.register(NoUsersTripsCell.self, forCellReuseIdentifier: "NoUsersTripsCell")
        tableView.separatorStyle = .none
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        presenter?.doTripsExist()
        presenter?.doesntExist = { [self] in
            doesExist = false
            self.tableView.reloadData()
        }
        presenter?.exist = { [self] in
            doesExist = true
            self.tableView.reloadData()
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Trips of other users"
        navigationController?.hidesBarsOnSwipe = true
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        if doesExist == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTripsCell", for: indexPath) as! UsersTripsCell
            cell.backgroundColor = .clear
            cell.layer.compositingFilter = "multiplyBlendMode"
            return cell
        }
        if doesExist == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoUsersTripsCell", for: indexPath) as! NoUsersTripsCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat()
        height = usersTripsCellView.backView.bounds.height + 10
        return height
    }

    

}
