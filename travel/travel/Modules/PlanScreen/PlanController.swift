//
//  TripController.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class PlanController: UITableViewController, PlanViewInput {
    
    private let backView = BackgroundView()
    private var transportAmount: Int?
    private var residenceAmount: Int?
    var presenter: PlanViewOutput?
    var plan: Plan?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(PlanNameCell.self, forCellReuseIdentifier: "name")
        tableView.register(TransportCell.self, forCellReuseIdentifier: "transport")
        tableView.register(ResidenceInfoCell.self, forCellReuseIdentifier: "residence")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        transportAmount = presenter?.getTransportCount()
        residenceAmount = presenter?.getResidencesCount()
        switch section {
        case 0:
            return 1
        case 1:
            guard let number = transportAmount else { return 0 }
            return number
        case 2:
            guard let number = residenceAmount else { return 0 }
            return number
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let plan = plan else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as! PlanNameCell
           
            cell.planTitle.text = plan.planTitle
            if plan.location == ""  {
                cell.backView.isHidden = true
            } else {
                cell.backView.isHidden = false
                cell.locationTitle.text = plan.location

            }
                        
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "transport", for: indexPath) as! TransportCell
            let transport = presenter?.getTransport(index: indexPath.row)
            cell.typeLabel.text = transport?.type.rawValue
            if transport?.startDate != nil && transport?.endDate != nil {
                let startDate = convertDateToString(date: (transport?.startDate)!)
                let endDate = convertDateToString(date: (transport?.endDate)!)
                cell.startLabel.text = startDate
                cell.endLabel.text = endDate
            } else {
                cell.startLabel.text = "Starts"
                cell.endLabel.text = "Ends"
            }
            if transport?.from != nil {
                cell.startLocationLabel.text = transport?.from
            } else {
                cell.startLocationLabel.text = "From"
            }
            
            if transport?.whereTo != nil {
                cell.endLocationLabel.text = transport?.whereTo
            } else {
                cell.endLocationLabel.text = "Where"
            }
            
            if let budget = transport?.budget {
                cell.budgetLabel.text = "Budget: \(budget)"
            } else {
                cell.budgetLabel.text = "0"
            }
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "residence", for: indexPath) as! ResidenceInfoCell
            let residence = presenter?.getResidence(index: indexPath.row)
            cell.nameLabel.text = residence?.name
            
            if residence?.startDate != nil && residence?.endDate != nil {
                let startDate = convertDateToString(date: (residence?.startDate)!)
                let endDate = convertDateToString(date: (residence?.endDate)!)
                cell.startLabel.text = startDate
                cell.endLabel.text = endDate
            } else {
                cell.startLabel.text = "Starts"
                cell.endLabel.text = "Ends"
            }
            
            if let budget = residence?.budget{
                cell.budgetLabel.text = "Budget: \(budget)"
            } else {
                cell.budgetLabel.text = "0"
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    private func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, d/MM/y"
        let string = formatter.string(from: date)
        return string
    }
    
}
