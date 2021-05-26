//
//  LocationCitiesController.swift
//  travel
//
//  Created by Svetlana Safonova on 19.05.2021.
//

import UIKit

protocol LocationDelegate {
    func didChoosePlanLocation(location: String)
    func didChooseTransportStartLocation(location: String, index: Int)
    func didChooseTransportEndLocation(location: String, index: Int)
}

class LocationCitiesController: UITableViewController, LocationCitiesViewInput {
    
    var router: LocationCitiesRouter?
    var presenter: LocationCitiesPresenter?
    var getBack: (() -> Void)?
    var delegate: LocationDelegate?
    var gotFrom: String?
    var index: Int?
    
    var country: String = ""
    var cities: [String] = []
    
    lazy var citiesTableView: UITableView = self.tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let backButton = createBackButton()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setupTableView() {
        tableView.register(CountryCell.self, forCellReuseIdentifier: "city")
        tableView.backgroundColor = CustomColors.backgroundTableView
        tableView.separatorStyle = .none
    }

    private func createBackButton() -> UIButton {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.setTitle("Back", for: .normal)
        button.setTitleColor(button.tintColor, for: .normal)
        button.addTarget(self, action: #selector(getBackAction), for: .touchUpInside)
        return button
    }
    
    @objc private func getBackAction() {
        self.getBack?()
        print("success")
        self.navigationController?.popViewController(animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath) as! CountryCell
        cell.titleLabel.text = cities[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showAddPlanController()
        let cell = tableView.cellForRow(at: indexPath) as! CountryCell
        guard let city = cell.titleLabel.text else { return }
        guard let index = index else { return }
        
        guard let from = gotFrom else { return }
        switch from {
        case "plan":
            delegate?.didChoosePlanLocation(location: "\(country), " + city)
        case "start":
            delegate?.didChooseTransportStartLocation(location: "\(country), " + city, index: index)
        case "end":
            delegate?.didChooseTransportEndLocation(location: "\(country), " + city, index: index)
        default:
            print("Noting")
        }
        
        
       
    }
}
