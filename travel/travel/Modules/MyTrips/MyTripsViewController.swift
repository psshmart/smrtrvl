//
//  MyTripsViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 27.03.2021.
//

import UIKit

class MyTripsViewController: UITableViewController, TripsViewInput {
    
    private var backView = BackgroundView()
    var coordinator: MyTripsCoordinator?
    var presenter: MyTripsPresenter?
    private var doesExist: Bool?
    private let tripsCellView = MyTripsCell()
    private let noTripsCellView = NoTripsCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.doesntExist = { [self] in
            doesExist = false
            self.tableView.reloadData()
        }
        presenter?.exist = { [self] in
            doesExist = true
            self.tableView.reloadData()
        }

        self.presenter?.viewDidLoad()
        
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(MyTripsCell.self, forCellReuseIdentifier: "MyTripCell")
        tableView.register(NoTripsCell.self, forCellReuseIdentifier: "NoTripsCell")
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Create new trip"
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        if doesExist == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTripCell", for: indexPath) as! MyTripsCell
            cell.backgroundColor = .clear
            cell.layer.compositingFilter = "multiplyBlendMode"
            return cell
        }
        if doesExist == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoTripsCell", for: indexPath) as! NoTripsCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat()
        height = tripsCellView.backView.bounds.height + 10
        return height
        
    }
    
}
