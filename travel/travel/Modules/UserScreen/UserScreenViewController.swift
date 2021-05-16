//
//  UserScreenViewController.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import UIKit

class UserScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TripsSegmentedControlDelegate {
    
    func changeToIndex(index: Int) {
        selectedIndex = index
        self.tableView.reloadData()
    }
    
    private var backView: BackgroundView?
    var userInfoView: UserInfoView?
    var coordinator: UserScreenRouter?
    var presenter: UserScreenPresenter?
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    private var selectedIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        backView = BackgroundView(frame: view.frame)
        guard let backView = backView else { return }
        view.addSubview(backView)
        userInfoView = UserInfoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.4))
        guard let userView = userInfoView else { return }
        userView.tripsSegmentedControl.delegate = self
        view.addSubview(userView)
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        switch selectedIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTrips", for: indexPath) as! UserTripsCell
            cell.backgroundColor = .clear
            cell.layer.compositingFilter = "multiplyBlendMode"
            tableView.rowHeight = cell.backView.frame.height + 10
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LikedTrips", for: indexPath) as! UsersTripsCell
            cell.backgroundColor = .clear
            cell.layer.compositingFilter = "multiplyBlendMode"
            tableView.rowHeight = cell.backView.frame.height + 10
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
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
    
}
