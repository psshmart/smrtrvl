//
//  UserScreenViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit

class UserScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TripsSegmentedControlDelegate, UserScreenViewInput {
    
    func changeToIndex(index: Int) {
        selectedIndex = index
        self.tableView.reloadData()
    }
    
    private var backView: BackgroundView?
    var userInfoView: UserInfoView?
    var coordinator: UserScreenRouter?
    var presenter: UserScreenPresenter?
    var tableView = UITableView()
    var safeArea: UILayoutGuide!
    private var selectedIndex: Int?
    var tripsData: [Trip] = []
    var likedTripsData: [Trip] = []
    lazy var userTableView: UITableView = self.tableView
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        backView = BackgroundView(frame: view.frame)
        guard let backView = backView else { return }
        view.addSubview(backView)
        userInfoView = UserInfoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.4))
        guard let userView = userInfoView else { return }
        userView.tripsSegmentedControl.delegate = self
        userView.usernameLabel.text = presenter?.getUsername()
        view.addSubview(userView)
        safeArea = view.layoutMarginsGuide
        setupTableView()
        selectedIndex = 0
        presenter?.viewDidLoad()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex == 0 {
            return tripsData.count
        } else {
            return likedTripsData.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex == 0 {
            coordinator?.getTripController(trip: tripsData[indexPath.row])
        } else {
            coordinator?.getTripController(trip: likedTripsData[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        switch selectedIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTrips", for: indexPath) as! UserTripsCell
            let trip = tripsData[indexPath.row]
            cell.backgroundColor = .clear
            tableView.rowHeight = cell.backView.frame.height + 10
            cell.tripNameLabel.text = trip.title
            
            if trip.startDate != nil || trip.endDate != nil {
                let startDate = convertDateToString(date: trip.startDate!)
                let endDate = convertDateToString(date: trip.endDate!)
                cell.dateLabel.text = "\(startDate) - \(endDate)"
            } else {
                cell.dateLabel.text = "Date"
            }
    
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LikedTrips", for: indexPath) as! UsersTripsCell
            cell.backgroundColor = .clear
            tableView.rowHeight = cell.backView.frame.height + 10
            let likedTrip = likedTripsData[indexPath.row]
            cell.usernameLabel.text = likedTrip.username
            cell.tripNameLabel.text = likedTrip.title
            
            cell.likeButton.tag = indexPath.row
            if let isLiked = likedTripsData[indexPath.row].isLiked {
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
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTrips", for: indexPath) as! UserTripsCell
            cell.backgroundColor = .clear
            cell.layer.compositingFilter = "multiplyBlendMode"
            tableView.rowHeight = cell.backView.frame.height + 10
            return cell
        }
    }
    
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        presenter?.viewDidLoad()
        selectedIndex = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        selectedIndex = 0
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(370)
            make.width.equalTo(view.bounds.width)
            make.bottom.equalToSuperview().offset(0)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.backgroundView = BackgroundView(frame: view.frame, heightToTop: view.frame.height/2)
        tableView.separatorStyle = .none
        tableView.register(UserTripsCell.self, forCellReuseIdentifier: "UserTrips")
        tableView.register(UsersTripsCell.self, forCellReuseIdentifier: "LikedTrips")
        
    }
    
    private func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let string = formatter.string(from: date)
        return string
    }
    
    @objc private func likeTrip(sender: UIButton) {
        presenter?.likeTrip(trip: likedTripsData[sender.tag], index: sender.tag)
        
        sender.removeTarget(nil, action: nil, for: .allEvents)
        sender.addTarget(self, action: #selector(unlikeTrip), for: .touchUpInside)
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImage = UIImage(systemName: "heart.fill", withConfiguration: config)
        sender.setImage(configImage, for: .normal)
        
        
    }
    
    @objc private func unlikeTrip(sender: UIButton) {
        presenter?.unlikeTrip(trip: likedTripsData[sender.tag], index: sender.tag)
        
        sender.removeTarget(nil, action: nil, for: .allEvents)
        sender.addTarget(self, action: #selector(likeTrip), for: .touchUpInside)
        let configN = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular, scale: .small)
        let configImageN = UIImage(systemName: "heart", withConfiguration: configN)
        sender.setImage(configImageN, for: .normal)
        
    }
    
}
