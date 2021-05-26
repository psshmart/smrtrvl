//
//  AddPlanPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 23.05.2021.
//

import UIKit

class AddPlanPresenter: AddPlanViewOutput, LocationDelegate {
    
    weak var view: AddPlanViewInput?
    
    private var trip: Trip
    private var plan = Plan(location: "", planTitle: "", budget: 0, transports: [], residences: [])
    var transport: [Transport] = []
    private var residence: [Residence] = []
    
    init(trip: Trip, view: AddPlanViewInput) {
        self.trip = trip
        self.view = view
    }
    
    func savePlan() {
        plan.transports = transport
        plan.residences = residence
        trip.plans.append(plan)
    }
    
    func didChoosePlanLocation(location: String) {
        plan.location = location
        view?.planTableView.reloadData()
    }
    
    func didChooseTransportStartLocation(location: String, index: Int) {
        transport[index].from = location
        view?.planTableView.reloadData()
    }
    
    func didChooseTransportEndLocation(location: String, index: Int) {
        transport[index].whereTo = location
        view?.planTableView.reloadData()
    }
    
    func getTrip() -> Trip {
        let thisTrip = self.trip
        return thisTrip
    }
    
    func getNumberOfTransport() -> Int {
        let count = transport.count
        return count
    }
    
    func getNumberOfResindences() -> Int {
        let count = residence.count
        return count
    }
    
    func addTransport() {
        self.transport.append(Transport(type: .Default, startDate: nil, endDate: nil, from: "", whereTo: "", budget: 0))
    }
    
    func addResidence() {
        self.residence.append(Residence(name: "", startDate: nil, endDate: nil, budget: 0))
    }
    
    func setStartDateToPlan(date: Date) {
        self.plan.startDate = date
    }
    
    func setEndDateToPlan(date: Date) {
        self.plan.endDate = date
    }
    
    func getPlan() -> Plan {
        let thisPlan = self.plan
        return thisPlan
    }
    
    func setPlanTitle(title: String) {
        plan.planTitle = title
    }
    
    func setBudget(budget: Decimal) {
        plan.budget = budget
    }
    
    func setStartDateToTransport(date: Date, index: Int) {
        self.transport[index].startDate = date
    }
    
    func setEndDateToTransport(date: Date, index: Int) {
        self.transport[index].endDate = date
    }
    
    func getTransport(index: Int) -> Transport {
        self.transport[index]
    }
    
    func setTransportBudget(budget: Decimal, index: Int) {
        transport[index].budget = budget
    }
    
    func setTransportType(type: TransportType, index: Int) {
        transport[index].type = type
    }
    
    func getResidences(index: Int) -> Residence {
        residence[index]
    }
    
    func setStartDateToResidence(date: Date, index: Int) {
        residence[index].startDate = date
    }
    
    func setEndDateToResidence(date: Date, index: Int) {
        residence[index].endDate = date
    }
    
    func setResidenceBudget(budget: Decimal, index: Int) {
        residence[index].budget = budget
    }
    
    func setResidenceName(index: Int, title: String) {
        residence[index].name = title
    }
}
