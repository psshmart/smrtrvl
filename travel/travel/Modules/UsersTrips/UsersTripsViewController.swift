//
//  UsersTripsViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

import UIKit

class UsersTripsViewController: UITableViewController, UISearchBarDelegate, UsersTripsViewInput {
    
    private let backView = BackgroundView()
    var searchBar = UISearchBar()
    var coordinator: UsersTripsCoordinator?
    var presenter: UsersTripsPresenter?
    var doesExist: Bool?
    private var usersTripsCellView = UsersTripsCell()
    var tripsService: TripsService = TripsService()
    var trips: [Trip] = []
    var thisTrips: [Trip] = []
    lazy var usersTableView: UITableView = self.tableView
    var isLiked: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(UsersTripsCell.self, forCellReuseIdentifier: "UsersTripsCell")
        tableView.register(NoUsersTripsCell.self, forCellReuseIdentifier: "NoUsersTripsCell")
        tableView.separatorStyle = .none
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        setGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Trips of other users"
        navigationController?.hidesBarsOnSwipe = true
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        trips = []
    }
    
    // MARK: - Table view data source
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let text = searchBar.text, (text.isEmpty == false ) {
            
            let searchedTrips = trips.filter( { $0.title.contains(searchText)})
            if searchedTrips.count > 0 {
                trips = searchedTrips
                tableView.reloadData()
            } else {
                trips = thisTrips
                tableView.reloadData()
            }
            
        } else {
            trips = thisTrips
            tableView.reloadData()
        }
       
       
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if trips.isEmpty { return 1 }
        else  {
            return trips.count
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.getTripController(trip: trips[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        if trips.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoUsersTripsCell", for: indexPath) as! NoUsersTripsCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTripsCell", for: indexPath) as! UsersTripsCell
            cell.likeButton.tag = indexPath.row
            if let isLiked = trips[indexPath.row].isLiked {
                if isLiked == true {
                    cell.isLiked = true
                    cell.likeButton.addTarget(self, action: #selector(unlikeTrip), for: .touchUpInside)
                    let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
                    let configImage = UIImage(systemName: "heart.fill", withConfiguration: config)
                    cell.likeButton.setImage(configImage, for: .normal)
                } else {
                    cell.isLiked = false
                    cell.likeButton.addTarget(self, action: #selector(likeTrip), for: .touchUpInside)
                    let configN = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
                    let configImageN = UIImage(systemName: "heart", withConfiguration: configN)
                    cell.likeButton.setImage(configImageN, for: .normal)
                    
                }
            }
            
            
            cell.backgroundColor = .clear
            cell.tripNameLabel.text = trips[indexPath.row].title
            if trips[indexPath.row].username != nil {
                cell.usernameLabel.text = trips[indexPath.row].username
            } else {
                cell.usernameLabel.text = "no username"
            }
            return cell
        }
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == tableView {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
            {
                if trips.isEmpty {
                    presenter?.getTrips(isEmpty: true)
                } else {
                    presenter?.getTrips(isEmpty: false)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat()
        height = usersTripsCellView.backView.bounds.height + 10
        return height
    }
    
    
    
    @objc private func likeTrip(sender: UIButton) {
        presenter?.likeTrip(trip: trips[sender.tag], index: sender.tag)
        
        sender.removeTarget(nil, action: nil, for: .allEvents)
        sender.addTarget(self, action: #selector(unlikeTrip), for: .touchUpInside)
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImage = UIImage(systemName: "heart.fill", withConfiguration: config)
        sender.setImage(configImage, for: .normal)
        
        
    }
    
    @objc private func unlikeTrip(sender: UIButton) {
        presenter?.unlikeTrip(trip: trips[sender.tag], index: sender.tag)
        
        sender.removeTarget(nil, action: nil, for: .allEvents)
        sender.addTarget(self, action: #selector(likeTrip), for: .touchUpInside)
        let configN = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImageN = UIImage(systemName: "heart", withConfiguration: configN)
        sender.setImage(configImageN, for: .normal)
        
    }
    
    
}
