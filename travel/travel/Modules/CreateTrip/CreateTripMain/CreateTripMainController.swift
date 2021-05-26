//
//  CreateTripMainController.swift
//  travel
//
//  Created by Svetlana Safonova on 15.05.2021.
//

import UIKit

class CreateTripMainController: UITableViewController, UITextFieldDelegate, CreateTripViewInput {
    
    
    private let backView = BackgroundView()
    var coordinator: CreateTripRouter?
    var presenter: (CreateTripViewOutput & PlanSaved)?
    lazy var createTableView: UITableView = self.tableView
    private var tripData: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Create new trip"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTrip))
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        tripData = presenter?.getTrip()
    }
    
    // MARK: - Setup TableView
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(TitleTripCell.self, forCellReuseIdentifier: "main")
        tableView.register(DatePickerCell.self, forCellReuseIdentifier: "date")
        tableView.register(BudgetCell.self, forCellReuseIdentifier: "budget")
        tableView.register(CreateNewPlanCell.self, forCellReuseIdentifier: "create")
        tableView.register(MyTripsCell.self, forCellReuseIdentifier: "plan")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let trip = tripData else { return 1 }
        if trip.plans.count == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            guard let planCount = tripData?.plans.count else { return 0 }
            return planCount
        default:
            return 0
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0 :
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath) as! TitleTripCell
                cell.titleTextField.delegate = self
                cell.titleTextField.addTarget(self, action: #selector(didChangeTitle), for: .editingChanged)
                cell.privacyButton.addTarget(self, action: #selector(didChangePrivacy), for: .touchUpInside)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath) as! DatePickerCell
                cell.datePicker.addTarget(self, action: #selector(didChangeStartDate), for: .valueChanged)
                let minDate = setMinDate()
                cell.datePicker.minimumDate = minDate
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath) as! DatePickerCell
                cell.datePicker.addTarget(self, action: #selector(didChangeEndtDate), for: .valueChanged)
                let trip = presenter?.getTrip()
                if trip?.startDate == nil {
                    cell.datePicker.isEnabled = false
                } else {
                    cell.datePicker.isEnabled = true
                    cell.datePicker.minimumDate = trip?.startDate
                }
                cell.dateLabel.text = "Ends"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath) as! BudgetCell
                cell.budgetTextField.placeholder = "Enter your budget"
                cell.budgetTextField.delegate = self
                cell.budgetTextField.addTarget(self, action: #selector(didChangeBudget), for: .editingChanged)
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "create", for: indexPath) as! CreateNewPlanCell
                cell.addButton.addTarget(self, action: #selector(addPlanButtonAction), for: .touchUpInside)
                return cell
            default:
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "plan", for: indexPath) as! MyTripsCell
            let cellData = tripData?.plans[indexPath.row]
            cell.nameLabel.text = cellData?.planTitle
            if cellData?.startDate != nil && cellData?.endDate != nil {
                let startDate = convertDateToString(date: (cellData?.startDate)!)
                let endDate = convertDateToString(date: (cellData?.endDate)!)
                cell.dateLabel.text = "\(startDate) - \(endDate)"
            }
            return cell
        default:
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.deletePlan(index: indexPath.row)
            completionHandler(true)
        }
        delete.backgroundColor = CustomColors.selectedViewPurple
        
        if indexPath.section == 1 {
            let configuration = UISwipeActionsConfiguration(actions: [delete])
            return configuration
        } else {
            return UISwipeActionsConfiguration(actions: [])
        }
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 30
    }
    
    // MARK: - Buttons Targets
    
    @objc private func addPlanButtonAction(sender: UIButton) {
        let trip = presenter?.getTrip()
        if trip?.startDate == nil || trip?.endDate == nil {
            showAlert(title: "Whoops!", message: "You need to set start and end date before")
        } else {
            guard let trip = presenter?.getTrip() else { return }
            coordinator?.getAddPlanController(trip: trip, delegate: presenter!)
        }
    }
    
    @objc private func didChangePrivacy(sender: UIButton) {
        presenter?.updatePrivacy(isPrivate: false)
    }
    
    @objc private func saveTrip(sender: UIBarButtonItem) {
        getTrip()
        if tripData?.title == "" {
            showAlert(title: "Whoops!", message: "You need to set Trip Title")
        } else {
            presenter?.saveTrip()
            coordinator?.getMyTripsController()
        }
    }
    
    // MARK: - UI Targets
    
    @objc private func didChangeTitle(sender: UITextField) {
        guard let title = sender.text else { return }
        presenter?.updateTitle(title: title)
    }
    
    @objc private func didChangeBudget(sender: UITextField) {
        guard let budgetText = sender.text else { return }
        guard let budget = Decimal(string: budgetText) else { return }
        presenter?.updateBudget(budget: budget)
    }
    
    @objc private func didChangeStartDate(sender: UIDatePicker) {
        presenter?.updateStartDate(date: sender.date)
        let indexPath = IndexPath(row: 4, section: 0)
        let indexPath2 = IndexPath(row: 2, section: 0)
        tableView.reloadRows(at: [indexPath, indexPath2], with: .none)
    }
    
    @objc private func didChangeEndtDate(sender: UIDatePicker) {
        presenter?.updateEndDate(date: sender.date)
        let indexPath = IndexPath(row: 4, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    // MARK: - Private funcs
    
    private func setMinDate() -> Date {
        let currentDate = Date()
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        var components = DateComponents()
        components.calendar = calendar
        components.day = 0
        guard let minDate = calendar.date(byAdding: components, to: currentDate) else { return Date() }
        return minDate
    }
    
    private func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let string = formatter.string(from: date)
        return string
    }
    
    private func deletePlan(index: Int) {
        guard var plans = tripData?.plans else { return }
        plans.remove(at: index)
        tripData?.plans = plans
        tableView.reloadData()
        print("Deleted")
    }
    
    func getTrip() {
        tripData = presenter?.getTrip()
        tableView.reloadData()
    }
}
