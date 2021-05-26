//
//  MyTripsPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

class MyTripsPresenter: TripsViewOutput {
    
    weak var view: TripsViewInput?
    
    var tripsService = TripsService()
    
    private var trips: [Trip] = []
    
    init(view: TripsViewInput) {
        self.view = view
    }
    
    
    func viewDidLoad() {
        self.getTrips()
    }
    
    private func didLoadTrips() {
        self.view?.tripsData = trips
        self.view?.tripTableView.reloadData()
    }
    
    private func getTrips() {
        tripsService.getUserTrips { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let trips):
                self?.trips = trips
                self?.didLoadTrips()
            }
        }
    }
    
    func deleteTrip(trip: Trip) {
        tripsService.deleteTrip(trip: trip)
        self.getTrips()
    }
    
    
}
