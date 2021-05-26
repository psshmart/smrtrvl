//
//  TripPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class PlanPresenter: PlanViewOutput {
    private var plan: Plan
    
    weak var view: PlanViewInput?
    
    init(plan: Plan, view: PlanViewInput) {
        self.plan = plan
        self.view = view
    }
    
    func viewDidLoad() {
        self.view?.plan = plan
    }
    
    func getTransportCount() -> Int {
        let count = plan.transports.count
        return count
    }
    
    func getResidencesCount() -> Int {
        let count = plan.residences.count
        return count 
    }
    
    func getTransport(index: Int) -> Transport {
        let transport = plan.transports[index]
        return transport
    }
    
    func getResidence(index: Int) -> Residence {
        let residence = plan.residences[index]
        return residence
    }
}
