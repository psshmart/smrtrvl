//
//  TripProtocol.swift
//  travel
//
//  Created by Svetlana Safonova on 26.05.2021.
//

import Foundation

protocol TripViewOutput {
    func getPlansCount() -> Int
    func getPlan(index: Int) -> Plan
    func viewDidLoad() 
}

protocol TripViewInput: AnyObject {
    var trip: Trip? { get set }
}
