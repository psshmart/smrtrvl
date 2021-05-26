//
//  UsersTripsProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 30.03.2021.
//

import UIKit

protocol UsersTripsViewOutput {
    func getTrips(isEmpty: Bool)
    func tripsDidLoad()
    func likeTrip(trip: Trip, index: Int)
    func unlikeTrip(trip: Trip, index: Int)
}

protocol UsersTripsViewInput: AnyObject {
    var trips: [Trip] { get set }
    var thisTrips: [Trip] { get set }
    var usersTableView: UITableView { get set }
    var isLiked: Bool? { get set }
}
