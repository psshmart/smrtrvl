//
//  UserScreenProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 25.05.2021.
//

import UIKit

protocol UserScreenViewInput: AnyObject {
    var tripsData: [Trip] { get set }
    var likedTripsData: [Trip] { get set }
    var userTableView: UITableView { get set }
}

protocol UserScreenViewOutput {
    
}
