//
//  UsersTripsPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

class UsersTripsPresenter: UsersTripsViewOutput {
    
    private var tripsService = TripsService()
    
    private var trips: [Trip] = []
    
    private var view: UsersTripsViewInput?
    
    var isLiked: Bool?
    
    init(view: UsersTripsViewInput) {
        self.view = view
    }
    
    func viewDidLoad() {
        getTrips(isEmpty: true)
    }
    
    func getTrips(isEmpty: Bool) {
        tripsService.getUsersTrip(isEmpty: isEmpty) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let trips):
                self.trips = trips
                self.tripsService.checkIfLiked(trips: self.trips) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let newTrips):
                        self.view?.trips.append(contentsOf: newTrips)
                        self.view?.usersTableView.reloadData()
                    }
                }
            }
            
        }
    }
    
    internal func tripsDidLoad() {
        view?.usersTableView.reloadData()
    }
    
    func likeTrip(trip: Trip, index: Int) {
        tripsService.saveToLikedTrips(trip: trip) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("saved")
            }
        }
        
        
    }
    
    func unlikeTrip(trip: Trip, index: Int) {
        tripsService.unlikeTrip(trip: trip)
    }
}
