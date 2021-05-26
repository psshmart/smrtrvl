//
//  TripPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import UIKit

class TripPresenter: TripViewOutput {
    
    weak var view: TripViewInput?
    
    private var trip: Trip
    
    init(trip: Trip, view: TripViewInput) {
        self.trip = trip
        self.view = view
        self.trip.plans.sort {
            $0.startDate! < $1.startDate!
        }
    }
    
    func viewDidLoad() {
        view?.trip = self.trip
    }
    func getPlansCount() -> Int {
        let count = self.trip.plans.count
        return count
    }
    
    func getPlan(index: Int) -> Plan {
        let plan = trip.plans[index]
        return plan
    }
    
}
