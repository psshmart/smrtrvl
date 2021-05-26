//
//  AddPlanProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 23.05.2021.
//

import Foundation
import UIKit

protocol AddPlanViewOutput {
    func getTrip() -> Trip
    func getPlan() -> Plan
    func getTransport(index: Int) -> Transport
    func getResidences(index: Int) -> Residence
    func getNumberOfTransport() -> Int
    func getNumberOfResindences() -> Int
    func addTransport()
    func addResidence()
    func setStartDateToPlan(date: Date)
    func setEndDateToPlan(date: Date)
    func setPlanTitle(title: String)
    func setBudget(budget: Decimal)
    func setStartDateToTransport(date: Date, index: Int)
    func setEndDateToTransport(date: Date, index: Int)
    func setStartDateToResidence(date: Date, index: Int)
    func setEndDateToResidence(date: Date, index: Int)
    func setTransportBudget(budget: Decimal, index: Int)
    func setTransportType(type: TransportType, index: Int)
    func setResidenceBudget(budget: Decimal, index: Int)
    func setResidenceName(index: Int, title: String)
    func savePlan()
}

protocol AddPlanViewInput: AnyObject {
    var planTableView: UITableView { get set }
}
