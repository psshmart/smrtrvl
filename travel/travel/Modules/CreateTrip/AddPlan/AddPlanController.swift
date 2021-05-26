//
//  AddPlanController.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

protocol PlanSaved {
    func planSaved(trip: Trip)
}

class AddPlanController: UITableViewController, AddPlanViewInput {
    
    lazy var planTableView: UITableView = self.tableView
    
    private let backView = BackgroundView()
    var router: AddPlanRouter?
    var presenter: (AddPlanViewOutput & LocationDelegate)?
    private var transportAmount: Int?
    private var residenceAmount: Int?
    var delegate: PlanSaved?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePlan))
    }
    // MARK: - setup TableView
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(LocationCell.self, forCellReuseIdentifier: "location")
        tableView.register(TransportInfoCell.self, forCellReuseIdentifier: "transport")
        tableView.register(ResidenceCell.self, forCellReuseIdentifier: "residence")
        tableView.register(AddPlanHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerView")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        switch section {
        case 0:
            return 1
        case 1:
            guard let transportAmount = presenter?.getNumberOfTransport() else { return 0}
            self.transportAmount = transportAmount
            return transportAmount
        case 2:
            guard let residencesAmount = presenter?.getNumberOfResindences() else { return 0}
            self.residenceAmount = residencesAmount
            return residencesAmount
        default:
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = .clear
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath) as! LocationCell
            cell.addButton.tag = 1
            cell.addButton.addTarget(self, action: #selector(showLocationScreen), for: .touchUpInside)
            
            cell.startDatePickerView.datePicker.addTarget(self, action: #selector(didChangeStartDate), for: .valueChanged)
            cell.endsDatePickerView.datePicker.addTarget(self, action: #selector(didChangeEndDate), for: .valueChanged)
            let trip = presenter?.getTrip()
            cell.startDatePickerView.datePicker.minimumDate = trip?.startDate
            cell.startDatePickerView.datePicker.maximumDate = trip?.endDate
            let plan = presenter?.getPlan()
            if plan?.startDate == nil {
                cell.endsDatePickerView.datePicker.isEnabled = false
            } else {
                cell.endsDatePickerView.datePicker.isEnabled = true
            }
            cell.endsDatePickerView.datePicker.minimumDate = trip?.startDate
            cell.endsDatePickerView.datePicker.maximumDate = trip?.endDate
            cell.titleTextField.addTarget(self, action: #selector(didChangeTitle), for: .editingChanged)
            
            cell.budgetView.valueTextField.addTarget(self, action: #selector(checkWholeBudget), for: .editingDidEnd)
            cell.budgetView.valueTextField.addTarget(self, action: #selector(didChangeBudget), for: .editingDidEnd)
            cell.selectionStyle = .none
            
            if plan?.location != "" {
                cell.addButton.setTitle(plan?.location, for: .normal)
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "transport", for: indexPath) as! TransportInfoCell
            let plan = presenter?.getPlan()
            let transport = presenter?.getTransport(index: indexPath.row)
            var previousEndDate:Date? = nil
            if indexPath.row != 0 {
                let previousTransport = presenter?.getTransport(index: indexPath.row - 1)
                previousEndDate = previousTransport?.endDate
            }
                
            if indexPath.row == 0 {
                cell.startDatePickerView.datePicker.minimumDate = plan?.startDate
            } else {
                if previousEndDate == nil {
                    cell.startDatePickerView.datePicker.isEnabled = false
                } else {
                    cell.startDatePickerView.datePicker.isEnabled = true
                    cell.startDatePickerView.datePicker.minimumDate = previousEndDate
                }
            }
            
            cell.startDatePickerView.datePicker.datePickerMode = .dateAndTime
            cell.endsDatePickerView.datePicker.datePickerMode = .dateAndTime
            
            cell.startDatePickerView.datePicker.tag = indexPath.row
            cell.endsDatePickerView.datePicker.tag = indexPath.row
            
            cell.startDatePickerView.datePicker.addTarget(self, action: #selector(didChangeTransportStartDate), for: .valueChanged)
            cell.endsDatePickerView.datePicker.addTarget(self, action: #selector(didChangeTransportEndDate), for: .valueChanged)
            
            cell.startDatePickerView.datePicker.maximumDate = plan?.endDate
            
            if transport?.startDate == nil {
                cell.endsDatePickerView.datePicker.isEnabled = false
            } else {
                cell.endsDatePickerView.datePicker.isEnabled = true
            }
            
            let transportStartDate = transport?.startDate
            cell.endsDatePickerView.datePicker.minimumDate = transportStartDate
            cell.endsDatePickerView.datePicker.maximumDate = plan?.endDate
            
            cell.budgetView.valueTextField.tag = indexPath.row
            cell.budgetView.valueTextField.addTarget(self, action: #selector(checkPlanBudget), for: .editingDidBegin)
            cell.budgetView.valueTextField.addTarget(self, action: #selector(didChangeTransportBudget), for: .editingDidEnd)
            if let thisBudget = transport?.budget {
                cell.budgetView.valueTextField.text = "\(thisBudget)"
            } else {
                cell.budgetView.valueTextField.text = ""
            }
            
            cell.pickerView.didChangeType = { [unowned self] value in
                presenter?.setTransportType(type: value, index: indexPath.row)
            }
            
            cell.startLocationView.locationButton.tag = indexPath.row
            cell.endLocationView.locationButton.tag = indexPath.row
            
            cell.startLocationView.locationButton.addTarget(self, action: #selector(showLocationScrenToStartLocation), for: .touchUpInside)
            cell.endLocationView.locationButton.addTarget(self, action: #selector(showLocationScrenToEndLocation), for: .touchUpInside)
            
            if transport?.from != "" {
                cell.startLocationView.locationButton.setTitle(transport?.from, for: .normal)
            } else {
                cell.startLocationView.locationButton.setTitle("Location", for: .normal)
            }
            
            if transport?.whereTo != "" {
                cell.endLocationView.locationButton.setTitle(transport?.whereTo, for: .normal)
            } else {
                cell.endLocationView.locationButton.setTitle("Location", for: .normal)
            }
           
            cell.pickerView.pickerView.selectRow(0, inComponent: 0, animated: false)
            
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "residence", for: indexPath) as! ResidenceCell
            let plan = presenter?.getPlan()
            let residence = presenter?.getResidences(index: indexPath.row)
            
            if indexPath.row == 0 {
                cell.startDayResidenceView.datePicker.minimumDate = plan?.startDate
            } else {
                let previousResidence = presenter?.getResidences(index: indexPath.row - 1)
                let previousEndDate = previousResidence?.endDate
                cell.startDayResidenceView.datePicker.minimumDate = previousEndDate
            }
            cell.startDayResidenceView.datePicker.maximumDate = plan?.endDate
            
            cell.startDayResidenceView.datePicker.tag = indexPath.row
            cell.endDayResidenceView.datePicker.tag = indexPath.row
            
            cell.startDayResidenceView.datePicker.addTarget(self, action: #selector(didChangeResidenceStartDate), for: .valueChanged)
            cell.endDayResidenceView.datePicker.addTarget(self, action: #selector(didChangeResidenceEndDate), for: .valueChanged)
            
            if residence?.startDate == nil {
                cell.endDayResidenceView.datePicker.isEnabled = false
            } else {
                cell.endDayResidenceView.datePicker.isEnabled = true
            }
            
            let residenceStartDate = residence?.startDate
            cell.endDayResidenceView.datePicker.minimumDate = residenceStartDate
            cell.endDayResidenceView.datePicker.maximumDate = plan?.endDate
            
            cell.budgetView.valueTextField.tag = indexPath.row
            cell.budgetView.valueTextField.addTarget(self, action: #selector(checkPlanBudget), for: .editingDidBegin)
            cell.budgetView.valueTextField.addTarget(self, action: #selector(didChangeResidenceBudget), for: .editingDidEnd)
            if let thisBudget = residence?.budget {
                cell.budgetView.valueTextField.text = "\(thisBudget)"
            } else {
                cell.budgetView.valueTextField.text = ""
            }
            
            cell.nameView.valueTextField.tag = indexPath.row
            cell.nameView.valueTextField.addTarget(self, action: #selector(didChangeResidenceName), for: .editingChanged)
            return cell
        default:
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let transportHeader = AddPlanHeaderView()
            transportHeader.backgroundColor = .clear
            transportHeader.addButton.addTarget(self, action: #selector(addTransport), for: .touchUpInside)
            transportHeader.titleLabel.text = "Add Transport"
            tableView.sectionHeaderHeight = UITableView.automaticDimension
            
            return transportHeader
        case 2:
            let residenceHeader =  AddPlanHeaderView()
            residenceHeader.titleLabel.text = "Add Residence"
            tableView.sectionHeaderHeight = UITableView.automaticDimension
            residenceHeader.addButton.addTarget(self, action: #selector(addResidence), for: .touchUpInside)
            return residenceHeader
        default:
            tableView.sectionHeaderHeight = UITableView.automaticDimension
            return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
    }
    
    
    // MARK: - Buttons Targtes
    
    @objc func savePlan(sender: UIBarButtonItem) {
        guard let plan = presenter?.getPlan() else { return }
        if plan.planTitle == "" {
            showAlert(title: "Whoops!", message: "You need to set Plan Title")
        } else {
            presenter?.savePlan()
            guard let savedTrip = presenter?.getTrip() else { return }
            delegate?.planSaved(trip: savedTrip)
            router?.getCreateTripViewController()
        }
    }
    @objc func showLocationScreen(sender: UIButton) {
        router?.getLocationViewController(source: "plan", index: 0, presenter: presenter!)
    }
    
    @objc func showLocationScrenToStartLocation(sender: UIButton) {
        router?.getLocationViewController(source: "start", index: sender.tag, presenter: presenter!)
    }
    
    @objc func showLocationScrenToEndLocation(sender: UIButton) {
        router?.getLocationViewController(source: "end", index: sender.tag, presenter: presenter!)
    }
    
    @objc private func addTransport() {
        let plan = presenter?.getPlan()
        if plan?.startDate == nil || plan?.endDate == nil {
            showAlert(title: "Whoops!", message: "You need to set start and end date before")
        } else {
            presenter?.addTransport()
            tableView.reloadData()
        }
    }
    
    @objc private func addResidence() {
        let plan = presenter?.getPlan()
        if plan?.startDate == nil || plan?.endDate == nil {
            showAlert(title: "Whoops!", message: "You need to set start and end date before")
        } else {
            presenter?.addResidence()
            tableView.reloadData()
        }
    }
    
    // MARK: - UI Targets
    
    @objc private func didChangeStartDate(sender: UIDatePicker) {
        presenter?.setStartDateToPlan(date: sender.date)
        tableView.reloadData()
    }
    
    @objc private func didChangeEndDate(sender: UIDatePicker) {
        presenter?.setEndDateToPlan(date: sender.date)
        tableView.reloadData()
    }
    
    @objc private func didChangeTitle(sender: UITextField) {
        guard let title = sender.text else { return }
        presenter?.setPlanTitle(title: title)
    }
    
    @objc private func didChangeBudget(sender: UITextField) {
        guard let budgetText = sender.text else { return }
        guard let budget = Decimal(string: budgetText) else { return }
        guard let trip = presenter?.getTrip() else { return }
        if trip.budget < budget {
            showAlert(title: "Whoops!", message: "Your trip's budget is lower than the budget of this plan")
        } else {
            presenter?.setBudget(budget: budget)
            tableView.reloadData()
        }
    }
    
    @objc private func checkWholeBudget(sender: UITextField) {
        guard let trip = presenter?.getTrip() else { return }
        if trip.budget == 0 {
            sender.isEnabled = false
            showAlert(title: "Whoops!", message: "You need to set the budget for a whole trip before")
        } else {
            sender.isEnabled = true
        }
    }
    
    @objc private func didChangeTransportStartDate(_ sender: UIDatePicker) {
        presenter?.setStartDateToTransport(date: sender.date, index: sender.tag)
        tableView.reloadData()
    }
    
    @objc private func didChangeResidenceStartDate(sender: UIDatePicker) {
        presenter?.setStartDateToResidence(date: sender.date, index: sender.tag)
        tableView.reloadData()
    }
    
    @objc private func didChangeTransportEndDate( sender: UIDatePicker) {
        presenter?.setEndDateToTransport(date: sender.date, index: sender.tag)
        tableView.reloadData()
    }
    
    @objc private func didChangeResidenceEndDate(sender: UIDatePicker) {
        presenter?.setEndDateToResidence(date: sender.date, index: sender.tag)
        tableView.reloadData()
    }
    
    @objc private func checkPlanBudget(sender: UITextField) {
        guard let plan = presenter?.getPlan() else { return }
        if plan.budget == 0 {
            sender.isEnabled = false
            showAlert(title: "Whoops", message: "You need to set budget for a whole plan before")
        } else {
            sender.isEnabled = true
        }
    }
    
    @objc private func didChangeTransportBudget( sender: UITextField) {
        guard let budgetText = sender.text else { return }
        guard let budget = Decimal(string: budgetText) else { return }
        guard let plan = presenter?.getPlan() else { return }
        guard let allTransport = presenter?.getNumberOfTransport() else { return }
        guard let allResidences = presenter?.getNumberOfResindences() else { return }
        
        var budgetSumOfResidences: Decimal = 0
        if allResidences > 0 {
            for i in 0...allResidences-1 {
                let residence = presenter?.getResidences(index: i)
                guard let residenceBudget = residence?.budget else { return }
                budgetSumOfResidences += residenceBudget
            }
        }
        
        var budgetSumOfTransport: Decimal = 0
        
        
        for i in 0...allTransport-1 {
            let transport = presenter?.getTransport(index: i)
            guard let transportBudget = transport?.budget else { return }
            if i != sender.tag {
                budgetSumOfTransport += transportBudget
            }
        }
        
        if plan.budget < budget + budgetSumOfTransport + budgetSumOfResidences {
            showAlert(title: "Whoops", message: "Your plan's budget is lower than the budget of your trips end residences")
            sender.text = ""
        } else {
            presenter?.setTransportBudget(budget: budget, index: sender.tag)
            tableView.reloadData()
        }
    }
    
    @objc private func didChangeResidenceBudget(sender: UITextField) {
        guard let budgetText = sender.text else { return }
        guard let budget = Decimal(string: budgetText) else { return }
        guard let plan = presenter?.getPlan() else { return }
        guard let allTransport = presenter?.getNumberOfTransport() else { return }
        guard let allResidences = presenter?.getNumberOfResindences() else { return }
        
        var budgetSumOfResidences: Decimal = 0
        
        for i in 0...allResidences-1 {
            let residence = presenter?.getResidences(index: i)
            guard let residenceBudget = residence?.budget else { return }
            if i != sender.tag {
                budgetSumOfResidences += residenceBudget
            }
        }
        
        var budgetSumOfTransport: Decimal = 0
        
        if allTransport > 0 {
            for i in 0...allTransport-1 {
                let transport = presenter?.getTransport(index: i)
                guard let transportBudget = transport?.budget else { return }
                budgetSumOfTransport += transportBudget
            }
        }
        
        if plan.budget < budget + budgetSumOfTransport + budgetSumOfResidences {
            showAlert(title: "Whoops", message: "Your plan's budget is lower than the budget of your trips end residences")
            sender.text = ""
        } else {
            presenter?.setResidenceBudget(budget: budget, index: sender.tag)
            tableView.reloadData()
        }
        
    }
    
    
    @objc private func didChangeResidenceName(sender: UITextField) {
        guard let title = sender.text else { return }
        presenter?.setResidenceName(index: sender.tag, title: title)
    }
    // MARK: - Private Funcs

}
