//
//  UserScreenPresenter.swift
//  travel
//
//  Created by Svetlana Safonova on 26.04.2021.
//

import Foundation

class UserScreenPresenter: UserScreenViewOutput {
    weak var view: UserScreenViewInput?
    
    private var tripsService = TripsService()
    private var authService = AuthorizationService()
    
    private var trips: [Trip] = []
    
    private var likedTrips: [Trip] = []
    
    init(view: UserScreenViewInput) {
        self.view = view
    }
    
    func viewDidLoad() {
        getTrips()
        getLikedTrips()
    }
    
    private func didLoadTrips() {
        view?.tripsData = trips
        view?.userTableView.reloadData()
    }
    
    private func didLoadLikedTrips() {
        var newLikedTrips: [Trip] = []
        for var trip in likedTrips {
            var liked = trip
            liked.isLiked = true
            newLikedTrips.append(liked)
        }
        view?.likedTripsData = newLikedTrips
        view?.userTableView.reloadData()
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
    
    private func getLikedTrips() {
        tripsService.getLikedTrips { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let likedTrips):
                self?.likedTrips = likedTrips
                
                self?.didLoadLikedTrips()
            }
        }
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
    
    func getUsername() -> String {
        let username = authService.getUsername()
        return username
    }
}
