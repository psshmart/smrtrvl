//
//  TripController.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class TripController: UITableViewController, TripViewInput {
    
    private let backView = BackgroundView()
    private var plansAmount: Int?
    var presenter: TripViewOutput?
    var router: TripRouter?
    var trip: Trip?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(TripNameCell.self, forCellReuseIdentifier: "name")
        tableView.register(PlanCell.self, forCellReuseIdentifier: "plan")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard trip != nil else { return 0 }
        plansAmount = trip?.plans.count
        if plansAmount == 0 {
            return 1
        } else {
            return 2
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard trip != nil else { return }
        if indexPath.section != 0 {
            router?.getPlanController(plan: trip!.plans[indexPath.row])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard trip != nil else { return 0 }
        switch section {
        case 0:
            return 1
        case 1:
            guard let plansCount = trip?.plans.count else { return 0 }
            return plansCount
        default:
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard trip != nil else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as! TripNameCell
            cell.tripTitle.text = trip?.title
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "plan", for: indexPath) as! PlanCell
            let plan = presenter?.getPlan(index: indexPath.row)
            
            cell.planName.text = plan?.planTitle
            
            if plan?.startDate != nil && plan?.endDate != nil {
                let startDate = convertDateToString(date: (plan?.startDate)!)
                let endDate = convertDateToString(date: (plan?.endDate)!)
                cell.dateLabel.text = "\(startDate) - \(endDate)"
            } else {
                cell.dateLabel.text = "No date"
            }
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    private func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let string = formatter.string(from: date)
        return string
    }
    
    
    
}
