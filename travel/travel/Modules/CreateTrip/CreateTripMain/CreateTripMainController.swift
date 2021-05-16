//
//  CreateTripMainController.swift
//  travel
//
//  Created by Svetlana Safonova on 15.05.2021.
//

import UIKit

class CreateTripMainController: UITableViewController, UITextFieldDelegate {

    private let backView = BackgroundView()
    var coordinator: CreateTripRouter?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Create new trip"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

    }
    
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.backgroundView = backView
        tableView.register(TitleTripCell.self, forCellReuseIdentifier: "main")
        tableView.register(DatePickerCell.self, forCellReuseIdentifier: "date")
        tableView.register(BudgetCell.self, forCellReuseIdentifier: "budget")
        tableView.register(CreateNewPlanCell.self, forCellReuseIdentifier: "create")
        tableView.separatorStyle = .none
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .none
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath) as! TitleTripCell
            cell.titleTextField.delegate = self
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath) as! DatePickerCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath) as! DatePickerCell
            cell.dateLabel.text = "Ends"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "budget", for: indexPath) as! BudgetCell
            cell.budgetTextField.placeholder = "Enter your budget"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "create", for: indexPath) as! CreateNewPlanCell
            cell.addButton.addTarget(self, action: #selector(addPlanButtonAction), for: .touchUpInside)
            return cell
        default:
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 30
    }
    
    @objc private func addPlanButtonAction() {
        coordinator?.getAddPlanController()
    }
}
