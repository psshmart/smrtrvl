//
//  MyTripsProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 29.03.2021.
//

import UIKit

protocol TripsViewOutput {
    func deleteTrip(trip: Trip)
}

protocol TripsViewInput: AnyObject {
    var tripsData: [Trip] { get set }
    var tripTableView: UITableView { get set }
}
