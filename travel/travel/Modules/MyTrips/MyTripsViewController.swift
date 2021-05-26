//
//  MyTripsViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 27.03.2021.
//

import UIKit

class MyTripsViewController: UITableViewController, TripsViewInput {
    private var backView = BackgroundView()
    var coordinator: MyTripsRouter?
    var presenter: MyTripsPresenter?
    private var doesExist: Bool?
    private let tripsCellView = MyTripsCell()
    private let noTripsCellView = NoTripsCell()
    var tripsData: [Trip] = []
    
    lazy var tripTableView: UITableView = self.tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTripButtonAction))
        presenter?.viewDidLoad()
        
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
        
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        presenter?.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tripsData.isEmpty {
            return 1
        } else {
            return tripsData.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.getTripController(trip: tripsData[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        if tripsData.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoTripsCell", for: indexPath) as! NoTripsCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            navigationItem.title = "Create new trip"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTripCell", for: indexPath) as! MyTripsCell
            cell.backgroundColor = .clear
            navigationItem.title = "My trips"
            let trip = tripsData[indexPath.row]
            cell.nameLabel.text = trip.title
            if trip.startDate != nil && trip.endDate != nil {
                let startDate = convertDateToString(date: trip.startDate!)
                let endDate = convertDateToString(date: trip.endDate!)
                cell.dateLabel.text = "\(startDate) - \(endDate)"
            } else {
                cell.dateLabel.text = "Date"
            }
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat()
        height = tripsCellView.backView.bounds.height + 10
        return height
        
    }
    
    @objc func addTripButtonAction() {
        coordinator?.getCreateTripViewController()
    }
    
    private func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let string = formatter.string(from: date)
        return string
    }
    
    private func deleteTrip(index: Int) {
        let trip = tripsData[index]
        presenter?.deleteTrip(trip: trip)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.showAlertOnDelete(title: "Wait!",message: "Are you sure you wanna delete this trip?", onDelete: {self?.deleteTrip(index: indexPath.row)})
            
            completionHandler(true)
        }
        delete.backgroundColor = CustomColors.selectedViewPurple
        
        
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
        
    }
}
