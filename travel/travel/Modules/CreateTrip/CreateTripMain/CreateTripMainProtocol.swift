//
//  CreateTripMainProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 16.05.2021.
//

import Foundation
import UIKit

protocol CreateTripViewOutput {
    func updateTitle(title: String)
    func updateStartDate(date: Date)
    func updateEndDate(date: Date)
    func updateBudget(budget: Decimal)
    func updatePrivacy(isPrivate: Bool)
    func getTrip() -> Trip
    func saveTrip()
}

protocol CreateTripViewInput: AnyObject {
    var createTableView: UITableView { get set }
    func getTrip()
}
