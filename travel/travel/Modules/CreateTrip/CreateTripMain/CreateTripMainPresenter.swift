//
//  CreateTripMainPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import UIKit

class CreateTripMainPresenter: CreateTripViewOutput, PlanSaved {
   
    weak var view: CreateTripViewInput?
    var service = TripsService()
    
    private var trip = Trip(id: UUID(), title: "", isPrivate: false ,startDate: nil, endDate: nil, budget: 0, plans: [], dailyPlans: [])
    
    init(view: CreateTripViewInput) {
        self.view = view
    }
    
    func saveTrip() {
        service.saveTrip(trip: trip) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("klass")
            }
        }
    }
    
    func planSaved(trip: Trip) {
        self.trip = trip
        view?.getTrip()
    }
    
    func updateTitle(title: String) {
        trip.title = title
    }
    
    func updateStartDate(date: Date) {
        trip.startDate = date
    }
    
    func updateEndDate(date: Date) {
        trip.endDate = date
    }
    
    func updateBudget(budget: Decimal) {
        trip.budget = budget
    }

    func updatePrivacy(isPrivate: Bool) {
        trip.isPrivate.toggle()
    }
    
    func getTrip() -> Trip {
        let thisTrip = trip
        return thisTrip
    }

}
